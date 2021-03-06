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
  mount_uploader :url, CoverUploader

  belongs_to :imageable, polymorphic: true, optional: true
  # validates :url, url: true
end
