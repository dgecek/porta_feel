class Newsgroup
  include Mongoid::Document

  store_in collection: 'articlesgroup'

  field :articles, type: Array
end