package Regexp::MultiLanguage::JavaScript;

use base qw(Regexp::MultiLanguage::BaseDialect);
use strict;
use warnings;

=head1 NAME

Regexp::MultiLanguage::JavaScript - JavaScript dialect for Regexp::MultiLanguage.

=head1 VERSION

Version 0.02

=cut

our $VERSION = 0.02;

=head1 SYNOPSIS

This module should not be used directly.  Please read the documentation
for L<Regexp::MultiLanguage>

=cut

sub wrap {
	return $_[1];
}

sub match_regex {
	my ($this, $regex) = @_;
	
	if ( $regex =~ /^m/ ) {
		$regex = substr $regex, 1;
	}
	
	return "(value.match($regex))";
}

sub comment_start {
	return '//';
}

sub make_function {
	my ($this,$name,$expr) = @_;
	my $prefix = $this->{'prefix'};
	return "function $prefix$name(value) { return $expr }\n";
}

sub function_call {
	my ($this,$name) = @_;
	my $prefix = $this->{'prefix'};
	return "$prefix$name(\$_[0])";
}

=head1 COPYRIGHT & LICENSE

Copyright 2006 Robby Walker, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;