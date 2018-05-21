# == Schema Information
#
# Table name: billing_infos
#
#  id         :bigint(8)        not null, primary key
#  last4      :string
#  country    :string
#  brand      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#

class BillingInfo < ApplicationRecord
  belongs_to :user, optional: true
end
