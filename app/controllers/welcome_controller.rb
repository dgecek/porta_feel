class WelcomeController < ApplicationController

  def initialize
    @get_grouped_articles_use_case = UseCaseFactory.provide_get_grouped_articles
  end

  def index
    @_request.env['HTTP_REFERER'] = 'http://example.com'
    @grouped_articles = @get_grouped_articles_use_case.execute
  end
end
