class JoinAppointmentsAndSessions < ActiveRecord::Migration
  def change
    change_table :sessions do |t|
      t.integer :appointment_id, index: true, foreign_key: true
    end
  end
end
