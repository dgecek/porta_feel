class SimilarityRepository

  def initialize(date_provider = UtilsFactory.provide_date_provider)
    @date_provider = date_provider
  end

  def get_recent_similarities
    Similarity.where(:date.gte => @date_provider.get_date_number_of_days_ago)
  end
end