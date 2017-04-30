class UseCaseFactory

  def self.provide_get_grouped_articles(get_grouped_articles = GetGroupedArticlesUseCase)
    get_grouped_articles.new
  end
end