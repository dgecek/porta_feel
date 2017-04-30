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
      if similarity.similarity > 0.20
        first_article = @news_article_repository.get_article similarity.firstArticleId
        second_article = @news_article_repository.get_article similarity.secondArticleId

        first_article_set = get_article_set_in_array first_article, array_of_similarity_sets
        unless first_article_set.nil?
          first_article_set.add(second_article)
          next
        end

        second_article_set = get_article_set_in_array second_article, array_of_similarity_sets
        unless second_article_set.nil?
          second_article_set.add(first_article)
          next
        end

        similarity_set = Set.new
        similarity_set.add first_article
        similarity_set.add second_article

        array_of_similarity_sets.insert(-1, similarity_set)
      end
    end
    array_of_similarity_sets
  end

  def get_article_set_in_array(element, array_of_sets)
    return_set = nil
    array_of_sets.each do |set|
      if set.include? element
        return_set = set
      end
    end
    return_set
  end
end