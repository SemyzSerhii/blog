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
  max_paginates_per 20

  # belongs_to
  belongs_to :user

  # has_one
  has_one :cover, as: :imageable, class_name: 'Image', dependent: :destroy
  accepts_nested_attributes_for :cover

  # has_many
  has_many :comments, dependent: :destroy

  # through
  has_many :commentable_users, through: :comments, source: :user

  # scoped
  has_many :recent_comments,
           -> { where('created_at > ?', 10.days.ago) },
           foreign_key: :post_id,
           class_name: 'Comment'

  validates :title, uniqueness: true, presence: true
  validates :body, presence: true
end
