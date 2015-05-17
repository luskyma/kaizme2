class Provider < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :patients
  has_many :availabilities
  has_many :appointments
end
