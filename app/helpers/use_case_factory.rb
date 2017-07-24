class UseCaseFactory

  def self.provide_get_grouped_articles(get_grouped_articles = GetGroupedArticlesUseCase)
    get_grouped_articles.new(RepositoryFactory.provide_articles_repository,
                             RepositoryFactory.provide_similarity_repository,
                             RepositoryFactory.provide_newsgroup_repo,
                             UtilsFactory.provide_date_provider)
  end
end