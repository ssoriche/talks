use utf8;
package MyApp::Schema::Result::Entry;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::Entry

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<entry>

=cut

__PACKAGE__->table("entry");

=head1 ACCESSORS

=head2 entry_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'entry_entry_id_seq'

=head2 user_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 entry

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "entry_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "entry_entry_id_seq",
  },
  "user_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "entry",
  { data_type => "text", is_nullable => 1 },
);

=head1 RELATIONS

=head2 user

Type: belongs_to

Related object: L<MyApp::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "MyApp::Schema::Result::User",
  { user_id => "user_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2017-10-26 08:30:51
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:70pvV0tTBr7vO8o3MHKAsw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
