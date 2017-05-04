require 'will_paginate'

class RecipesController < ApplicationController

  def index
    recipes = EdamamApiWrapper.getRecipeList(params[:search])
    @recipes = recipes.paginate(:page => params[:page], :per_page => 12)
  end

  def show
    @recipe = EdamamApiWrapper.getRecipe(params[:uri])
  end
end
