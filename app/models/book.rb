# == Schema Information
#
# Table name: books
#
#  id         :bigint(8)        not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :book_users, class_name: 'User'
end
