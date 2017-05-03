class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.getRecipeList
  end

  def show
  end
end
