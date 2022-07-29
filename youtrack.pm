package youtrack;

use strict;
use Data::Dumper;
require LWP::UserAgent;
use XML::Parser;
use JSON qw( decode_json );

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
	$ua->default_headers->header(
			'Content-Type'=>'application/json', 
			'Accept'=>'application/json', 
			'Authorization'=>'Bearer '.$arg{Token});

	my $response = $ua->get($arg{Url}.'/api/users/me');

	if ($response->is_success) {
		 	print "Logged to YT successfully\n" if ($arg{Debug});
		 	print Dumper($response) if ($arg{Debug});
			$self = { url => $arg{Url}, debug => $arg{Debug} };
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

# Returns the list of tag names for specific issue id
sub getTags {
	my $self = shift;
	my %arg = @_;

	my $response = $ua->get($self->{url}.'/api/issues/'.$arg{IssueKey}.'/tags?fields=name');

	if ($response->is_success) {
		my $json = JSON->new;
		my $tagsRaw = $json->decode($response->decoded_content);
		
		my @tags;
		foreach (@{$tagsRaw}) {
			push(@tags, $_->{name});
		}

		return @tags;
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
	my $max = $arg{Max} || 10000

	my $response = $ua->get($self->{url}.'/api/issues?query=project:%20'.$arg{Project}.'%20&$top='.$max.'&fields=created,numberInProject,comments(author(login)),idReadable,id,summary,description,reporter(login),customFields(name,value(name,login))');

	if ($response->is_success) {
		
		my $json = JSON->new;
		my $issues = $json->decode($response->decoded_content);

		foreach my $issue (@{$issues}) {
			foreach my $field (@{$issue->{customFields}}) {	

				$issue->{$field->{name}} = undef;
				next if (not($field->{value}));

				if($field->{'$type'} eq "SingleUserIssueCustomField") {
					$issue->{$field->{name}} = $field->{value}->{login};
				} elsif ($field->{'$type'} eq "MultiUserIssueCustomField") {
					foreach my $user (@{$field->{value}}) {
						$issue->{$field->{name}} = $user->{login};
				}
				} else {
					$issue->{$field->{name}} = $field->{value}->{name};
				}
			}
		}
		return $issues;
	} else {
		print "Got error while exporting issues\n";
		print $response->decoded_content."\n" if ($self->{debug});
		print $response->status_line."\n" if ($self->{debug});
	}
	return;
}

sub startAttachmentElement {
	my( $parseinst, $element, %attrs ) = @_;
	if ($element eq 'fileUrl') {
		push @{$data}, \%attrs;
	}
}

sub startElement {
	my( $parseinst, $element, %attrs ) = @_;
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
	if ($currentField && $context eq 'value') {
		$currentIssue->{$currentField} .= $cdata;
	}
	if ($context eq 'tag') {
		push @{$currentIssue->{tags}}, $cdata;
	}
}

sub characterTagData {
	my( $parseinst, $cdata ) = @_;
	my $context = $parseinst->{Context}->[-1];
	if ($context eq 'tag') {
		push @{$data}, $cdata;
	}
}

1;
