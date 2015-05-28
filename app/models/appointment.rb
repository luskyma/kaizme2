class Appointment < ActiveRecord::Base
  belongs_to :provider
  belongs_to :patient
  has_one :session, dependent: :destroy

  scope :for_patient, ->(user_id) { Appointment.where patient_id: user_id }
  scope :for_provider, ->(user_id) { Appointment.where provider_id: user_id }

  def book_appointment availability, patient
    update_attribute :provider_id, availability.provider_id
    update_attribute :patient_id, patient.id
    update_attribute :start, availability.start
    update_attribute :end, availability.end
  end
end

# class Appointment < ActiveRecord::Base
#   belongs_to :provider
#   belongs_to :patient
#   after_create :test
#   scope :for_patient, ->(user_id) { Appointment.where patient_id: user_id }


#   def book_appointment(appointment, availability_id, patient)
#     availability = Availability.find_by_id(availability_id)
#     self.patient_id = patient.id
#     self.provider_id = availability.provider_id

#   end

  # def assign_patient(id)
  #   update_attribute :patient_id, id
  # end
# end
