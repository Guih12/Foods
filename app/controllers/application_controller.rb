class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  protected

  def configure_permitted_paramters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name lastname age email password])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
  end
end
