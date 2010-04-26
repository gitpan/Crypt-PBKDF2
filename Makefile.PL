
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Crypt::PBKDF2',
                       'DISTNAME' => 'Crypt-PBKDF2',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.31'
                                               },
                       'AUTHOR' => 'Andrew Rodland <arodland@cpan.org>',
                       'BUILD_REQUIRES' => {
                                             'Test::More' => '0',
                                             'constant' => '0',
                                             'Encode' => '0'
                                           },
                       'ABSTRACT' => 'The PBKDF2 password hash algorithm',
                       'EXE_FILES' => [],
                       'VERSION' => '0.101160',
                       'PREREQ_PM' => {
                                        'Try::Tiny' => '0.04',
                                        'Digest::HMAC' => '1.01',
                                        'Moose::Role' => '0',
                                        'namespace::autoclean' => '0',
                                        'Moose::Util::TypeConstraints' => '0',
                                        'Carp' => '0',
                                        'MooseX::Method::Signatures' => '0.30',
                                        'MIME::Base64' => '0',
                                        'Digest' => '1.16',
                                        'Digest::SHA' => '0',
                                        'Moose' => '1'
                                      },
                       'LICENSE' => 'perl'
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



