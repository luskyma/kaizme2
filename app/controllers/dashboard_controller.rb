class DashboardController < ApplicationController
  def patients
    @appointments = Appointment.for_patient(current_user.id)
  end

  def providers
    @availabilities = Availability.by_provider(current_user.id)
  end

  def find_a_provider
  end
end
