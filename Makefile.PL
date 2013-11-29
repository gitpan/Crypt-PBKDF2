
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "The PBKDF2 password hash algorithm",
  "AUTHOR" => "Andrew Rodland <arodland\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Crypt-PBKDF2",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Crypt::PBKDF2",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Digest" => "1.16",
    "Digest::HMAC" => "1.01",
    "Digest::SHA" => 0,
    "MIME::Base64" => 0,
    "Method::Signatures::Simple" => 0,
    "Module::Runtime" => 0,
    "Moose" => 1,
    "Moose::Role" => 0,
    "Moose::Util::TypeConstraints" => 0,
    "Try::Tiny" => "0.04",
    "namespace::autoclean" => 0
  },
  "TEST_REQUIRES" => {
    "Encode" => 0,
    "Test::More" => 0,
    "constant" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.133330",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

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



