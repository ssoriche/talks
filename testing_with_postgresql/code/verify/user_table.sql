-- Verify test_postgresql:user_table on pg

BEGIN;

  SELECT 1/COUNT(0)
    FROM information_schema.tables
    WHERE table_name = 'user'
  ;

ROLLBACK;
