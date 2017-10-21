# Testing with PostgreSQL

An in depth look at perl testing using a PostgreSQL backend database.

### File breakdown

* `slides/Testing with PostgreSQL - Toronto Perl Mongers - October 26 2017.pdf`
  - The presentation including speaker notes as given to Toronto Perl Mongers
* `code/cpanfile` & `code/cpanfile.snapshot`
  - `App::Carton` installation files for recreating the environment used to
    execute tests
* `code/lib/MyApp/Schema*`
  - `DBIx::Class` schema and result modules used as an example application
    during testing.
* `code/t/sqitch.t`
  - Used to test the sqitch migrations contained within the
    `code/deploy`,`code/revert`,`code/verify`, directories.
* `code/t/lib/MyApp/Test/PostgreSQL.pm`
* `code/t/`

