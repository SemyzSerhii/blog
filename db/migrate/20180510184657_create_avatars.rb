# frozen_string_literal: true

class CreateAvatars < ActiveRecord::Migration[5.1]
  def change
    create_table :avatars do |t|
      t.references :imageable, polymorphic: true
      t.integer :author_id
    end
  end
end
