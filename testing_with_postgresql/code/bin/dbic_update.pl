#!/bin/env perl

use v5.20;
use autodie ':all';

use App::Sqitch;
use App::Sqitch::Command::deploy;
use App::Sqitch::Command::verify;
use Test::PostgreSQL;

my $db = Test::PostgreSQL->new;

my $sqitch = App::Sqitch->new(
  options => {
    engine => 'pg',
  },
);

my $deploy = App::Sqitch::Command::deploy->new(
  sqitch => $sqitch,
  target => $db->uri,
);

$deploy->execute();

say $db->dsn;
my $dsn = $db->dsn;

$dsn =~ s/^dbi/dbi/i;
$dsn =~ s/dbname\=/database=/i;

system "local/bin/dbicdump -o dump_directory=./lib MyApp::Schema '$dsn'";
