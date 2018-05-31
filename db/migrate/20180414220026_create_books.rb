# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.text :body
      t.timestamps
    end
  end
end
