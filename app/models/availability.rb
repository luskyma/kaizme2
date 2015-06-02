class Availability < ActiveRecord::Base
  belongs_to :provider
  scope :by_provider, ->(user_id) { Availability.where provider_id: user_id }
end
