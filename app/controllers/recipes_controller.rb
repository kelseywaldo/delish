class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.getRecipeList(params[:search])
  end

  def show
    @recipes = EdamamApiWrapper.getRecipe()
  end
end
