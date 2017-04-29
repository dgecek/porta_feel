class NewsArticleRepository

  def initialize(date_provider = UtilsFactory.provide_date_provider)
    @date_provider = date_provider
  end

  def get(article_id)
    NewsArticle.where(:id => article_id)
  end
end