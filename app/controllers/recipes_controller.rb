class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.getRecipeList(params[:search])
  end

  def show
    @recipe = EdamamApiWrapper.getRecipe(params[:uri])
  end
end
