class Newsarticle
  include Mongoid::Document

  store_in collection: 'newsarticles'

  field :_id, type: BSON::ObjectId
  field :url, type: String
  field :title, type: String
  field :body, type: String
  field :category, type: String
  field :portal, type: String
  field :sentiment, type: String
  field :predictedSentiment, type: String
  field :date, type: Date
  field :urlToImage, type: String
  field :tfIdfs, type: Hash
end
