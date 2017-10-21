-- Revert test_postgresql:entry_table from pg

BEGIN;

  DROP TABLE "entry";

COMMIT;
