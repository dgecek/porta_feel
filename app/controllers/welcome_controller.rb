class WelcomeController < ApplicationController

  def index
    @grouped_articles = @get_grouped_articles_use_case.execute
  end
end
