package youtrack;

use strict;
use Data::Dumper;
require LWP::UserAgent;
use XML::Parser;

my $ua;
our $currentField;
our $currentIssue;
our $data;

sub new {
	my $class = shift;
	my %arg = @_;
    return unless $arg{Url};
	my $self;

    $ua = LWP::UserAgent->new;
    $ua->timeout(10);

    my $response = $ua->post($arg{Url}.'/rest/user/login', Content => "login=".$arg{Login}."&password=".$arg{Password});
	#print Dumper($response);

    if ($response->is_success) {
        #my $parser = XML::Parser->new();
        #$parser->setHandlers( Start => \&startElement,
        #        End => \&endElement,
        #        Char => \&characterData,
        #        ); 
        #$parser->parse($response->decoded_content); 
		if ($response->decoded_content eq "<login>ok</login>") {
			#print "Logged to YT successfully\n";
			#print Dumper($response->{'_headers'}->{'set-cookie'});
			my $cookie = getSessionID($response);
			#print "Cookie: $cookie\n";
			$self = { cookie => $cookie, url => $arg{Url}, debug => $arg{Debug} };
			#${*$self}->{cookie} = $cookie;
			#${*$self}->{url} = $arg{Url};
		} else {
			print "Login to YT was unsuccessfull\n";
			print $response->decoded_content;
			exit 2;
		}
    }
    else {
        die $response->status_line;
    }

	bless $self, $class;
}

sub getAttachments {
	my $self = shift;
	my %arg = @_;
	my $response = $ua->get($self->{url}.'/rest/issue/'.$arg{IssueKey}.'/attachment', Cookie => $self->{cookie});
	if ($response->is_success) {
		my $parser = XML::Parser->new();
		undef $data;
		$parser->setHandlers( Start => \&startAttachmentElement );
		$parser->parse($response->decoded_content);
		print Dumper($data) if ($self->{debug});
		my @downloadedFiles;
		foreach (@{$data}) {
			my $r = $ua->get($_->{url}, Cookie => $self->{cookie});
			open F, ">/tmp/".$_->{name} or die "$! $_->{name}";
			binmode F;
			print F $r->content;
			close F;
			push @downloadedFiles, '/tmp/'.$_->{name};
		}
		return \@downloadedFiles;
	} else {
		print "Got error while getting attachments\n";
		print $response->decoded_content."\n";
	}
}

sub getTags {
	my $self = shift;
	my %arg = @_;
	my $response = $ua->get($self->{url}.'/rest/issue/'.$arg{IssueKey}.'/tags', Cookie => $self->{cookie});
	if ($response->is_success) {
		my $parser = XML::Parser->new();
		undef $data;
		$parser->setHandlers( Char => \&characterTagData );
		$parser->parse($response->decoded_content);
		print Dumper($data) if ($self->{debug});
		return $data;
	} else {
		print "Got error while getting attachments\n";
		print $response->decoded_content."\n";
	}
}

sub getIssueLinks {
	my $self = shift;
	my %arg = @_;
	my $response = $ua->get($self->{url}.'/rest/issue/'.$arg{IssueKey}.'/link', Cookie => $self->{cookie});
	if ($response->is_success) {
		my $parser = XML::Parser->new();
		undef $data;
		$parser->setHandlers( Start => \&startElement );
		$parser->parse($response->decoded_content);
		return $data;
	} else {
		print "Got error while getting links\n";
		print $response->decoded_content."\n";
	}
}

sub getIssue {
	my $self = shift;
	my %arg = @_;
	my $response = $ua->get($self->{url}.'/rest/issue/'.$arg{Key}, Cookie => $self->{cookie});
	if ($response->is_success) {
		print $response->decoded_content;
		my $parser = XML::Parser->new();
		undef $data;
		$parser->setHandlers( Start => \&startElement,
			End => \&endElement,
			Char => \&characterData,
			);
		my $decoded_content = $response->decoded_content;
		$decoded_content =~ s/\n/\{\{newline\}\}/g;
		$decoded_content =~ s/[^[:print:]]+//g;
		$decoded_content =~ s/\{\{newline\}\}/\n/g;
		$parser->parse($decoded_content);
		print Dumper($data);
		return $data;
	} else {
		print "Got error while getting issue\n";
	}
}

sub exportIssues {
	my $self = shift;
	my %arg = @_;
	my $max = $arg{Max} || 10000;
	print $self->{url}.'/rest/export/'.$arg{Project}.'/issues?max='.$max."\n";
	my $response = $ua->get($self->{url}.'/rest/export/'.$arg{Project}.'/issues?max='.$max, Cookie => $self->{cookie});
	if ($response->is_success) {
		my $parser = XML::Parser->new();
		undef $data;
		$parser->setHandlers( Start => \&startElement,
			End => \&endElement,
			Char => \&characterData,
			);
		my $decoded_content = $response->decoded_content;
		$decoded_content =~ s/\n/\{\{newline\}\}/g;
		$decoded_content =~ s/[^[:print:]]+//g;
		$decoded_content =~ s/\{\{newline\}\}/\n/g;
		$parser->parse($decoded_content);
		#print Dumper($data);
		return $data;
	} else {
		print "Got error while exporting issues\n";
	}
	return;
}

sub getSessionID {
	my $response = shift;
	
	foreach my $cookie (@{$response->{'_headers'}->{'set-cookie'}}) {
		if ($cookie =~ /JSESSIONID/) {
			$cookie =~ s/;.*$/;/;
			return $cookie;
		}
	}
	return;
}

sub startAttachmentElement {
    my( $parseinst, $element, %attrs ) = @_;
    #print "Start element: $element\n";
	if ($element eq 'fileUrl') {
		push @{$data}, \%attrs;
	}
}

sub startElement {
    my( $parseinst, $element, %attrs ) = @_;
    #print "Start element: $element\n";
	if ($element eq 'field') {
		$currentField = $attrs{name};
	} elsif ($element eq 'comment') {
		push @{$currentIssue->{comments}}, { created => $attrs{created}, text => $attrs{text}, author => $attrs{author} };
	} elsif ($element eq 'issueLink') {
		push @{$data}, { type => { name => $attrs{typeName} }, inwardIssue => { key => $attrs{target} }, outwardIssue => { key => $attrs{source} } };
	} elsif ($element eq 'value') {
		# This is a very ugly crutch. It disables the possibility to export the multivalue field. C'est la vie
		undef $currentIssue->{$currentField} if ($currentField && defined $currentIssue->{$currentField});
	}
}

sub endElement {
	my( $parseinst, $element ) = @_;
	#print " End element: $element\n";
	if ($element eq 'issue') {
		push @{$data}, $currentIssue;
		undef $currentIssue;
	} elsif ($element eq 'field') {
		undef $currentField;
	}
}

sub characterData {
    my( $parseinst, $cdata ) = @_;
	my $context = $parseinst->{Context}->[-1];
	#print "   Char data: $currentField $cdata\n";
	if ($currentField && $context eq 'value') {
		$currentIssue->{$currentField} .= $cdata;
	}
	if ($context eq 'tag') {
		push @{$currentIssue->{tags}}, $cdata;
	}
    #$context = (defined $mapping{$context})?$mapping{$context}:$context;
    #$currentOdds{$context} = $cdata;
}

sub characterTagData {
	my( $parseinst, $cdata ) = @_;
	my $context = $parseinst->{Context}->[-1];
	if ($context eq 'tag') {
		push @{$data}, $cdata;
	}
}

1;
