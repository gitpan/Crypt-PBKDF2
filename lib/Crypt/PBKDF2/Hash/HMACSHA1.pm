package Crypt::PBKDF2::Hash::HMACSHA1;
BEGIN {
  $Crypt::PBKDF2::Hash::HMACSHA1::VERSION = '0.110460';
}
# ABSTRACT: HMAC-SHA1 support for Crypt::PBKDF2 using Digest::SHA

use Moose;
use namespace::autoclean;
use Digest::SHA ();
use Carp qw(croak);

with 'Crypt::PBKDF2::Hash';

sub hash_len {
  return 20;
}

sub generate {
  my $self = shift; # ($data, $key)
  return Digest::SHA::hmac_sha1(@_);
}

sub to_algo_string {
  return;
}

sub from_algo_string {
  croak "No argument expected";
}

__PACKAGE__->meta->make_immutable;
1;


__END__
=pod

=head1 NAME

Crypt::PBKDF2::Hash::HMACSHA1 - HMAC-SHA1 support for Crypt::PBKDF2 using Digest::SHA

=head1 VERSION

version 0.110460

=head1 DESCRIPTION

Uses L<Digest::SHA> C<hmac_sha1> to provide the HMAC-SHA1 backend for
L<Crypt::PBKDF2>.

=head1 AUTHOR

Andrew Rodland <arodland@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Andrew Rodland.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

