class AddPatientIdToAppointment < ActiveRecord::Migration
  def change
    add_column :availabilities, :patient_id, :integer
  end
end
