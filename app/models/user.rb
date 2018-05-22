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
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :books, join_table: :book_users, dependent: :destroy, class_name: 'Book'

  has_one :avatar, as: :imageable, class_name: 'Image', dependent: :destroy
  has_one :billing_info, dependent: :destroy

  validates :username, uniqueness: true, presence: true
  validates :password, length: { is: 6 }, presence: true
end
