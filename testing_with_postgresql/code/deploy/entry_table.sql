-- Deploy test_postgresql:entry_table to pg

BEGIN;

  CREATE TABLE "entry" (
    entry_id SERIAL,
    user_id INTEGER REFERENCES "user"(user_id),
    entry TEXT
  );

COMMIT;
