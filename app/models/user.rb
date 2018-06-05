# frozen_string_literal: true

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
  attr_accessor :password

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :books, join_table: :book_users, dependent: :destroy, class_name: 'Book'

  has_one :avatar, as: :imageable, class_name: 'Image', dependent: :destroy
  has_one :billing_info, dependent: :destroy


  validates :username, uniqueness: true, presence: true
  validates :password, length: { minimum: 6 }, presence: :create

  before_save :encrypt_password


  def self.authenticate(username, password)
    @user = find_by_username(username)
    if @user && @user.password_hash == BCrypt::Engine.hash_secret(password, @user.password_salt)
      @user
    else
      nil
    end
  end


  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
