class Appointment < ActiveRecord::Base
  belongs_to :provider
  belongs_to :patient
  after_create :test
  scope :for_patient, ->(user_id) { Appointment.where patient_id: user_id }


end
