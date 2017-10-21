use Test::PostgreSQL;
use Test::Most;

use App::Sqitch;
use App::Sqitch::Target;
use App::Sqitch::Command::deploy;
use App::Sqitch::Command::verify;
use App::Sqitch::Command::revert;

bail_on_fail;

my $db = Test::PostgreSQL->new;

my $sqitch = App::Sqitch->new(
  options => {
    engine => 'pg',
  },
);

my $target = App::Sqitch::Target->new( sqitch => $sqitch);
my $plan   = $target->plan;

my ( @revert );
while ( my $change = $plan->next ) {
  my $deploy = App::Sqitch::Command::deploy->new(
    sqitch => $sqitch,
    target => $db->uri,
    to_change => $change->name,
  );

  lives_ok { $deploy->execute() } 'deploy sqitch plan to ' . $change->name;

  my $verify = App::Sqitch::Command::verify->new(
    sqitch => $sqitch,
    target => $db->uri,
    to_change => $change->name,
  );

  lives_ok { $verify->execute() } 'verify sqitch plan';

  push @revert, $change->name;
}

pop @revert;
while ( my $change_name = pop @revert ) {
  my $verify = App::Sqitch::Command::revert->new(
    sqitch => $sqitch,
    target => $db->uri,
    to_change => $change_name,
    no_prompt => 1,
  );

  lives_ok { $verify->execute() } 'revert sqitch plan to ' . $change_name;
}

done_testing();
