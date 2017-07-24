class NewsgroupRepository

  def initialize(date_provider)
    @date_provider = date_provider
  end

  def get_newsgroups
    Newsgroup.where({})
  end

end