class Similarity
  include Mongoid::Document

  field :similarityId, type: BSON::ObjectId

  field :firstArticleId, type: BSON::ObjectId
  field :secondArticleId, type: BSON::ObjectId

  field :similarity, type: Float
  field :date, type: Date
end
