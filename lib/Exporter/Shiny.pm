package Exporter::Shiny;

use 5.004;
use strict;
#use warnings;

use Exporter::Tiny ();

use vars qw( $AUTHORITY $VERSION );
$AUTHORITY = 'cpan:TOBYINK';
$VERSION   = '0.034';

sub import {
	my $me     = shift;
	my $caller = caller;
	
	(my $nominal_file = $caller) =~ s(::)(/)g;
	$INC{"$nominal_file\.pm"} ||= __FILE__;
	
	if (@_ == 2 and $_[0] eq -setup)
	{
		my (undef, $opts) = @_;
		@_ = @{ delete($opts->{exports}) || [] };
		
		if (%$opts) {
			Exporter::Tiny::_croak(
				'Unsupported Sub::Exporter-style options: %s',
				join(q[, ], sort keys %$opts),
			);
		}
	}
	
	ref($_) && Exporter::Tiny::_croak('Expected sub name, got ref %s', $_) for @_;
	
	no strict qw(refs);
	push @{"$caller\::ISA"}, 'Exporter::Tiny';
	push @{"$caller\::EXPORT_OK"}, @_;
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

Exporter::Shiny - shortcut for Exporter::Tiny

=head1 SYNOPSIS

   use Exporter::Shiny qw( foo bar );

Is a shortcut for:

   use base "Exporter::Tiny";
   push our(@EXPORT_OK), qw( foo bar );

For compatibility with L<Sub::Exporter>, the following longer syntax is
also supported:

   use Exporter::Shiny -setup => {
      exports => [qw( foo bar )],
   };

=head1 DESCRIPTION

This is a very small wrapper to simplify using L<Exporter::Tiny>.

=head1 BUGS

Please report any bugs to
L<http://rt.cpan.org/Dist/Display.html?Queue=Exporter-Tiny>.

=head1 SEE ALSO

L<Exporter::Tiny>.

=head1 AUTHOR

Toby Inkster E<lt>tobyink@cpan.orgE<gt>.

=head1 COPYRIGHT AND LICENCE

This software is copyright (c) 2014 by Toby Inkster.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 DISCLAIMER OF WARRANTIES

THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.

