class GetGroupedArticlesUseCase

  def initialize(news_article_repo, similarity_repo, newsgroup_repo, date_provider)
    @news_article_repository = news_article_repo
    @similarity_repository = similarity_repo
    @newsgroup_repository = newsgroup_repo
    @date_provider = date_provider
  end

  def execute
    @newsgroup_repository.get_newsgroups
  end
end