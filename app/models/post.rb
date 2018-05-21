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
  has_many :comments, dependent: :destroy
  has_one :cover, as: :imageable, class_name: 'Image', dependent: :destroy
  belongs_to :user, optional: true
end
