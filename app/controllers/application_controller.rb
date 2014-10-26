class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_user_time_zone
    return true unless current_user
    utc_offset = current_user.utc_offset || ENV['DEFAULT_UTC_OFFSET']
    user_timezone = ActiveSupport::TimeZone[utc_offset] || Time.zone
    Time.zone = user_timezone
  end
end
