class UtilsFactory

  def self.provide_date_provider(date_provider_class = DateProvider)
    date_provider_class.new
  end

end