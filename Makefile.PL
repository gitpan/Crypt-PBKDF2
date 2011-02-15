
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'The PBKDF2 password hash algorithm',
  'AUTHOR' => 'Andrew Rodland <arodland@cpan.org>',
  'BUILD_REQUIRES' => {
    'Encode' => '0',
    'Test::More' => '0',
    'constant' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Crypt-PBKDF2',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Crypt::PBKDF2',
  'PREREQ_PM' => {
    'Carp' => '0',
    'Digest' => '1.16',
    'Digest::HMAC' => '1.01',
    'Digest::SHA' => '0',
    'MIME::Base64' => '0',
    'Method::Signatures::Simple' => '0',
    'Moose' => '1',
    'Moose::Role' => '0',
    'Moose::Util::TypeConstraints' => '0',
    'Try::Tiny' => '0.04',
    'namespace::autoclean' => '0'
  },
  'VERSION' => '0.110460',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



