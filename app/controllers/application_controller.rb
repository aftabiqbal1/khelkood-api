class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :city, :address, :mobile_number, :active_status, :role])
    #devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end
