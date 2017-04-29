class GetGroupedArticlesUseCase

  def initialize(news_article_repo = RepositoryFactory.provide_articles_repository,
                 similarity_repo = RepositoryFactory.provide_similarity_repository)
    @news_article_repository = news_article_repo
    @similarity_repository = similarity_repo
  end

  def execute
    array_of_similarity_sets = Array.new
    recent_similarities = @similarity_repository.get_recent_similarities

    recent_similarities.each do |similarity|
      if similarity.similarity > 0.08
        similarity_set = Set.new
        similarity_set.add? similarity.firstArticleId
        similarity_set.add? similarity.secondArticleId
        array_of_similarity_sets.insert similarity_set
      end


    end

  end
end