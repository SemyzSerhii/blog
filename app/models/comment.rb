# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#  post_id    :bigint(8)
#

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :body, presence: true
end
