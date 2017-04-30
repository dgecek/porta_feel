class WelcomeController < ApplicationController

  def initialize
    @get_grouped_articles_use_case = UseCaseFactory.provide_get_grouped_articles
  end

  def index
    @grouped_articles = @get_grouped_articles_use_case.execute
  end
end
