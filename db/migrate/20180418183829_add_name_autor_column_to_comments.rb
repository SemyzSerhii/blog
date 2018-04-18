class AddNameAutorColumnToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comment, :name_autor, :string
  end
end
