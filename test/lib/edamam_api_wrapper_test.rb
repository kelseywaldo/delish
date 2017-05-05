require 'test_helper'

describe EdamamApiWrapper do

  before do
    VCR.insert_cassette("edamam")
  end

  after do
    VCR.eject_cassette("edamam")
  end

  describe "self.getRecipeList" do

    it "It will return an array" do
      recipes = EdamamApiWrapper.getRecipeList("apple")
      recipes.class.must_equal Array
    end

    it "All objects within the array are Recipes" do
      recipes = EdamamApiWrapper.getRecipeList("apple")

      recipes.each do | recipe |
        recipe.must_be_instance_of Recipe
      end
    end


    it "returns an empty array with an invalid search term" do
      recipes = EdamamApiWrapper.getRecipeList("")
      recipes.must_equal []
    end

  end

  describe "self.getRecipe(uri)" do

    it "Can get a recipe given a valid uri" do
      recipe = EdamamApiWrapper.getRecipe("http://www.edamam.com/ontologies/edamam.owl%23recipe_bef69a5e3324f42fce1eb845c1f57387")
      recipe.name.must_equal "Dinner Tonight: Rice Salad with Pesto and Shrimp"
    end

    it "Returns Nil for an invalid channel id" do
      recipe = EdamamApiWrapper.getRecipe("hat")
      recipe.must_be_nil
    end

  end

end
