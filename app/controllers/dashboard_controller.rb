class DashboardController < ApplicationController
  before_action :authenticate_user!
  def patients
    @appointments = Appointment.for_patient(current_user.patient.id).order(start: :asc)
  end

  def providers
    require_provider
    @availabilities = Availability.by_provider(current_user.id)
    @appointments = Appointment.for_provider(current_user.provider.id).order(start: :asc)
  end
end
