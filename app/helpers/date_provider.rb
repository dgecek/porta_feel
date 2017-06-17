class DateProvider
  def get_current_date
    Time.now
  end

  def get_date_number_of_days_ago(days = 2)
    recent_date = get_current_date - (days*24*60*60)
    recent_date
  end
end