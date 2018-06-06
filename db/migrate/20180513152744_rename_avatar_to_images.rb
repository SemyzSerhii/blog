# frozen_string_literal: true

class RenameAvatarToImages < ActiveRecord::Migration[5.1]
  def up
    rename_table :avatars, :images
    remove_column :images, :user_id
    add_column :images, :url, :string
  end

  def down
    add_reference :images, :user, foreign_key: true
    remove_column :images, :url
    rename_table :images, :avatars
  end
end
