package Devel::End::PrintINCVersion;

# DATE
# VERSION

use strict;
use warnings;

use ExtUtils::MakeMaker;

END {
    print "Versions of files in %INC:\n";
    for my $k (sort keys %INC) {
        my $path = $INC{$k};
        print "  $k ($path): ";
        if (-f $path) {
            my $v = MM->parse_version($path);
            print $v if defined $v;
        }
        print "\n";
    }
}

1;
# ABSTRACT: Print versions of files (modules) listed in %INC

=head1 SYNOPSIS

 % perl -MDevel::End::PrintINCVersion -e'...'


=head1 DESCRIPTION

After loading this module, when program ends, versions of files (modules) listed
in C<%INC> will be printed to STDOUT. The versions are extracted using
L<ExtUtils::MakeMaker>'s C<parse_version>.


=head1 SEE ALSO

L<Devel::EndHandler::PrintINCVersion>

Other C<Devel::End::*> modules
