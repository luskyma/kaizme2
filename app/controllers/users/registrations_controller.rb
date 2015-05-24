class Users::RegistrationsController < Devise::RegistrationsController



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
