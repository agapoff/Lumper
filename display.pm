package display;

use strict;
use warnings;
use Data::Dumper;

sub new {
    my ($class, %args) = @_;
    return bless { %args }, $class;
}

our sub printTitle {
    my $self = shift;
    my $text = shift;

    print generateTitle($text);
}

sub generateTitle {
    my $text = shift;
    my $textLength = length $text;

    return "\n".generateDelimiterPart($textLength).
        " $text ".
        generateDelimiterPart($textLength + $textLength % 2)."\n";
}

# Returns one half of a delimiter for the title
sub generateDelimiterPart {
    my $textLength = shift;
    my $halfTitleLength = 76 / 2;
    my $delimiter = "--------------------".
                    "--------------------".
                    "--------------------";
                    
    # Reduce '-' symbols based on title length + 2 spaces
    # on the trim only for one side of title.
    return substr   $delimiter, 0, 
                    $halfTitleLength - 
                        int(($textLength + 2) / 2);
}

our sub printColumnWidth {
	my $self = shift;
	my $text = shift;
	my $w = shift;
	my $len = length($text);
	if ($len < ($w * 8)) {
		print $text.("\t" x ($w - int($len / 8)));
	} else {
		print substr($text, 0, ($w * 8)-4)."...\t";
	}
}

our sub printColumnAligned {
    my $self = shift;
    my $text = shift;
    
    if (length($text) < 8) {
        print $text."\t\t\t\t";
    } elsif (length($text) < 16) {
        print $text."\t\t\t";
    } elsif (length($text) < 24) {
        print $text."\t\t";
    } elsif (length($text) < 32) {
        print $text."\t";
    } else {
        print substr ($text, 0, 32-4)."...\t";
    }
}

1;
