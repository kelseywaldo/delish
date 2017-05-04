require "test_helper"

describe RecipesController do

  describe "index" do

    it "should get index" do
      get recipes_path(0, 10, "apples")
      value(response).must_be :success?
    end

    it "@array should be an array of recipes" do
    end

  end

  describe "show" do

    it "should show recipe page " do
      get recipe_path
      value(response).must_be :success?
    end

  end

end
