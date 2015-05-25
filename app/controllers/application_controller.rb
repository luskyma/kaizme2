class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    current_user.is_provider ? dashboard_providers_path : dashboard_patients_path
  end

  def require_logged_in
    return true if current_user
    redirect_to root_path
  end

  def require_provider
    return true if current_user.is_provider
    redirect_to dashboard_patients_path
  end

  def require_patient
    return true unless current_user.is_provider
    redirect_to dashboard_providers_path
  end
end
