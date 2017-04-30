class NewsArticleRepository

  def initialize(date_provider = UtilsFactory.provide_date_provider)
    @date_provider = date_provider
  end

  def get_article(article_id)
    Newsarticle.where(:_id => article_id).first
  end
end