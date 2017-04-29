class RepositoryFactory

  def self.provide_similarity_repository(similarity_repo = SimilarityRepository)
    similarity_repo.new
  end

  def self.provide_articles_repository(article_repo = NewsArticleRepository)
    article_repo.new
  end
end