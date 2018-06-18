# frozen_string_literal: true
# == Schema Information
#
# Table name: books
#
#  id         :bigint(8)        not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#

class Book < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :book_users, class_name: 'User'
  
  scope :recent, -> { where('created_at > ?', 1.days.ago) } 

  validates :name, uniqueness: true, presence: true
  validates :body, presence: true
end
