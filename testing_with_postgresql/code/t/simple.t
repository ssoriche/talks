use MyApp::Test::PostgreSQL;
use MyApp::Test::Fixtures;

use Test::Most;

my $db = MyApp::Test::PostgreSQL->new;
my $dbic = $db->dbic;

my $dsn = $db->dsn;
$dsn =~ s/^dbi/dbi/i;

diag $dsn;

lives_ok { $db->deploy } 'database set up';
$db->perm_fixtures->load('basic_user');

$db->perm_fixtures->unload;
done_testing;
