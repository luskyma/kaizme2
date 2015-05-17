class Appointment < ActiveRecord::Base
  belongs_to :provider
  belongs_to :patient
end
