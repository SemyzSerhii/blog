# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#

class Post < ApplicationRecord
  attr_accessor :cover

  max_paginates_per 20

  has_many :comments, dependent: :destroy
  has_one :cover, as: :imageable, class_name: 'Image', dependent: :destroy
  belongs_to :user
  validates :title, uniqueness: true, presence: true
  validates :body, presence: true

  mount_uploader :image, ImageUploader
end
