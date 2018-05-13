class CreateAddIdColumnAvatars < ActiveRecord::Migration[5.1]
  def up
    remove_column :avatars, :author_id
    add_reference :avatars, :user, foreign_key: true
  end

  def down
    remove_column :avatars, :user_id
    add_column    :avatars, :author_id, :string
  end
end