# frozen_string_literal: true

# == Schema Information
#
# Table name: images
#
#  id             :bigint(8)        not null, primary key
#  imageable_type :string
#  imageable_id   :bigint(8)
#  url            :string
#

class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  validates :url, url: true
end
