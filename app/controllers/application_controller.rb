class ApplicationController < ActionController::Base
  SIGN_UP_PERMITTED_KEYS = %i[first_name last_name birthday address behavior avatar remove_avatar].freeze
  ACCOUNT_UPDATE_PERMITTED_KEYS = SIGN_UP_PERMITTED_KEYS + [:remove_avatar]
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  check_authorization unless: :devise_controller?

  rescue_from CanCan::AccessDenied do
    redirect_back fallback_location: root_path, alert: 'Access denied!'
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: SIGN_UP_PERMITTED_KEYS)
    devise_parameter_sanitizer.permit(:account_update, keys: ACCOUNT_UPDATE_PERMITTED_KEYS)
  end

  private

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end
end
