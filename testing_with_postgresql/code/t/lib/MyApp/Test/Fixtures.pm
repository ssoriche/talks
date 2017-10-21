package MyApp::Test::Fixtures;
use Moose;
extends 'DBIx::Class::EasyFixture';
use Crypt::Bcrypt::Easy ();

my %definition_for = (
  basic_user => {
    new => 'User',
    using => {
      user_name => 'tester',
      password => Crypt::Bcrypt::Easy->crypt( text => 'tester', cost => 10 )
    },
    next => [qw(user_entry)],
  },
  user_entry => {
    new => 'Entry',
    using => {
      user_id => \'basic_user',
      entry => 'This is my entry.',
    },
  },
);

sub get_definition {
    my ( $self, $name ) = @_;
    return $definition_for{$name};
}

sub all_fixture_names { return keys %definition_for }
