-- Deploy test_postgresql:user_table to pg

BEGIN;

  CREATE TABLE "user" (
    user_id SERIAL PRIMARY KEY,
    user_name TEXT UNIQUE,
    password TEXT
  );

COMMIT;
