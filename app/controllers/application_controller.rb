class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit::Authorization

  before_action :configure_sign_up_params, if: :devise_controller?


  def provider?
    render json: 'user not permitted', status: 401 unless current_user.provider?
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[name lastname age email type_user password password_confirmation])
  end
end
