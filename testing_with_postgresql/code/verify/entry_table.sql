-- Verify test_postgresql:entry_table on pg

BEGIN;

  SELECT 1/COUNT(0)
    FROM information_schema.tables
    WHERE table_name = 'user'
  ;

ROLLBACK;
