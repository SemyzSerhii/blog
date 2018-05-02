class ChangeIdColumnType < ActiveRecord::Migration[5.1]
  def up
    rename_table  :billihg_infos, :billing_infos

    remove_column :comments, :author_id
    add_reference :comments, :user, foreign_key: true
    remove_column :comments, :post_id
    add_reference :comments, :post, foreign_key: true

    remove_column :posts, :author_id
    add_reference :posts, :user, foreign_key: true

    remove_column :billing_infos, :user_id
    add_reference :billing_infos, :user, foreign_key: true

    remove_column :user_books, :author_id
    remove_column :user_books, :books_id
    add_reference :user_books, :user, foreign_key: true
    add_reference :user_books, :book, foreign_key: true

    remove_column :comments, :name_autor
  end

  def down
    remove_column :posts, :user_id
    add_column    :posts, :author_id, :string

    remove_column :comments, :user_id
    remove_column :comments, :post_id
    add_column    :comments, :author_id, :integer
    add_column    :comments, :post_id, :integer

    remove_column :billing_infos, :user_id
    add_column    :billing_infos, :user_id, :integer

    remove_column :user_books, :user_id
    remove_column :user_books, :book_id
    add_column    :user_books, :author_id, :integer
    add_column    :user_books, :books_id, :integer

    add_column :comments, :name_autor, :string

    rename_table  :billing_infos, :billihg_infos
  end
end
