class RenameBooksUsersToBookUsers < ActiveRecord::Migration[5.1]
  def change
    rename_table :books_users, :book_users
  end
end
