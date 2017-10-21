use utf8;
package MyApp::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::User

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<user>

=cut

__PACKAGE__->table("user");

=head1 ACCESSORS

=head2 user_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'user_user_id_seq'

=head2 user_name

  data_type: 'text'
  is_nullable: 1

=head2 password

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "user_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "user_user_id_seq",
  },
  "user_name",
  { data_type => "text", is_nullable => 1 },
  "password",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</user_id>

=back

=cut

__PACKAGE__->set_primary_key("user_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<user_user_name_key>

=over 4

=item * L</user_name>

=back

=cut

__PACKAGE__->add_unique_constraint("user_user_name_key", ["user_name"]);

=head1 RELATIONS

=head2 entries

Type: has_many

Related object: L<MyApp::Schema::Result::Entry>

=cut

__PACKAGE__->has_many(
  "entries",
  "MyApp::Schema::Result::Entry",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2017-10-26 08:30:51
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:WkyuKB2totRq0hNFR8A7Yw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
