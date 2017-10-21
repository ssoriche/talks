package MyApp::Test::PostgreSQL;

use strict;
use warnings;
use App::Sqitch;

use Moose;
use DBI;
use Test::PostgreSQL;
use DateTime;
use MyApp::Schema;
use App::Sqitch::Command::deploy;

has db => (
  is      => 'ro',
  isa     => 'Test::PostgreSQL',
  lazy    => 1,
  default => sub { Test::PostgreSQL->new },
);

has dsn => (
  is => 'ro',
  isa => 'Str',
  lazy => 1,
  default => sub { return $_[0]->db->dsn },
);

has dbh => (
  is      => 'ro',
  lazy    => 1,
  default => sub {
    DBI->connect(
      $_[0]->dsn,
      undef, undef,
      {
        pg_enable_utf8 => 1,
        RaiseError     => 1,
        AutoCommit     => 1,
      }
    )
  }
);

has dbic => (
  is      => 'ro',
  lazy    => 1,
  default => sub {
    my ($self) = @_;
    MyApp::Schema->connect({
      dbh_maker   => sub { $self->dbh },
      quote_names => 1,
    });
  }
);

has sqitch => (
  is      => 'ro',
  lazy    => 1,
  default => sub {
    App::Sqitch->new(
      options => {
        engine => 'pg',
      },
    )
  }
);

has fixtures => (
  is      => 'ro',
  lazy    => 1,
  default => sub {
    MyApp::Test::Fixtures->new( { schema => $_[0]->dbic } )
  },
);

has perm_fixtures => (
  is      => 'ro',
  lazy    => 1,
  default => sub {
    MyApp::Test::Fixtures->new( {
      schema          => $_[0]->dbic,
      no_transactions => 1,
    } )
  },
);

sub deploy {
  my $deploy = App::Sqitch::Command::deploy->new(
    sqitch => $_[0]->sqitch,
    target => $_[0]->db->uri,
  );

  $deploy->execute;
}

no Moose;
__PACKAGE__->meta->make_immutable;
1;
