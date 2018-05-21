# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  username   :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_one :avatar, as: :imageable, class_name: 'Image'
  has_one :billing_info
  has_and_belongs_to_many :books, through: :book_users
end
