module ApplicationHelper
  def default_timezone
    tz = ActiveSupport::TimeZone[ENV['DEFAULT_TIMEZONE']]
  end
end
