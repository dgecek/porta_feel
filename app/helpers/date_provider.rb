class DateProvider
  def get_current_date()
    Time.now
  end

  def get_date_number_of_days_ago(days = 3)
    get_current_date - (days*24*60*60)
  end
end