module TasksHelper

  def day_from_date(date)
	Date::DAYNAMES[date.wday]
  end
end
