class AddNameAutorColumnToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :name_autor, :string
  end
end
