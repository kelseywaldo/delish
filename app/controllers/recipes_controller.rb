class RecipesController < ApplicationController
  def index
    @recipes = ["chicken", "dinner", "food", "yum"]
    # all recipes found from search
    # using API Wrapper
  end

  def show
  end
end
