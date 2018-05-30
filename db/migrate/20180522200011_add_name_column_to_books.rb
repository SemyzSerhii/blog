# frozen_string_literal: true

class AddNameColumnToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :name, :string
  end
end
