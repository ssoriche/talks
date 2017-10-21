-- Revert test_postgresql:user_table from pg

BEGIN;

  DROP TABLE "user";

COMMIT;
