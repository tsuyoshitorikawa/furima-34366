class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :encrypted_password, :first_mane, :last_name, :first_name_kana, :last_name_kana, :birthbay])
  end
end

