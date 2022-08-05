package display;

use strict;
use warnings;
use Data::Dumper;

sub new {
    my ($class, %args) = @_;
    return bless { %args }, $class;
}

our sub printColumnAligned {
    my $self = shift;
    my $text = shift;

    if (length($text) < 8) {
        print $text."\t\t";
    } elsif (length($text) < 16) {
        print $text."\t";
    } else {
        print substr ($text, 0, 13)."...";
    }
}

1;