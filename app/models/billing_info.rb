class BillingInfo < ApplicationRecord
  belongs_to :user, optional: true
end
