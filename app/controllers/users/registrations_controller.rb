class Users::RegistrationsController < Devise::RegistrationsController

def after_update_path_for(resource)
    current_user.is_provider ? dashboard_providers_path : dashboard_patients_path
  end

private

def sign_up_params
  params.require(:user).permit(:email, :first_name, :last_name, :phone_number, :password,
              :password_confirmation, :current_password, :is_provider, :bio, :dob, :gender)
end

def account_update_params
  params.require(:user).permit(:email, :first_name, :last_name, :phone_number, :password,
              :password_confirmation, :current_password, :is_provider, :bio, :dob, :gender)
end

end
