class CreateUserBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_books do |t|
      t.integer :books_id
      t.integer :author_id
      t.timestamps
    end
  end
end
