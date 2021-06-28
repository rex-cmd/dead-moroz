class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do
    redirect_back fallback_location: root_path, alert: 'Access denied!'
  end
end
