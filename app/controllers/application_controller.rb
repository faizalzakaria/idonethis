class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  def set_user_time_zone
    tz = current_user ? current_user.timezone : nil
    Time.zone = tz || ActiveSupport::TimeZone[ENV['DEFAULT_TIMEZONE']]
  end
end
