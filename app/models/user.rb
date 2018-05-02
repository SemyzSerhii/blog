class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_one :billing_info
  has_many :books, through: :user_books
end
