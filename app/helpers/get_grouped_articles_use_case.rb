class GetGroupedArticlesUseCase

  def initialize(news_article_repo, similarity_repo, date_provider)
    @news_article_repository = news_article_repo
    @similarity_repository = similarity_repo
    @date_provider = date_provider
  end

  def execute
    array_of_similarity_sets = Array.new
    recent_similarities = @similarity_repository.get_recent_similarities

    recent_date = @date_provider.get_date_number_of_days_ago

    recent_similarities.each do |similarity|
      if similarity.similarity > 0.196
        first_article = @news_article_repository.get_article similarity.firstArticleId
        second_article = @news_article_repository.get_article similarity.secondArticleId

        if first_article.date < recent_date || second_article.date < recent_date
          next
        end

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

        array_of_similarity_sets.insert(-1, SimilaritySet.new(similarity_set, Array.new))
      end
    end
    array_of_similarity_sets
  end

  def get_article_set_in_array(element, similarity_sets)
    return_set = nil
    similarity_sets.each do |similarity_set|
      if similarity_set.set.include? element
        return_set = similarity_set.set
      end
    end
    return_set
  end
end