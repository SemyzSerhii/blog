class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_one :avatar, as: :imageable, class_name: 'Image'
  has_one :billing_info
  has_and_belongs_to_many :books, through: :book_users
end