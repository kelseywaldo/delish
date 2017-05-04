require 'test_helper'

describe EdamamApiWrapper do

  before do
    VCR.insert_cassette("edamam")
  end

  after do
    VCR.eject_cassette("edamam")
  end

  describe "self.getRecipeList" do

    it "It can get a list of recipes" do
      recipes = EdamamApiWrapper.getRecipeList(0, 10, "apple")
      recipes.class.must_equal Array
      recipes.length.must_equal 10

      recipes.each do | recipe |
        recipe.must_be_instance_of Recipe
      end
    end


    it "Will return an empty array with an invalid URI" do skip
      recipes = EdamamApiWrapper.getRecipeList("Bad token")
      recipes.must_equal []
    end

  end

  describe "self.getRecipe(uri)" do

    it "Can get a channel given a valid uri" do
      recipe = EdamamApiWrapper.getRecipe("http://www.edamam.com/ontologies/edamam.owl#recipe_bef69a5e3324f42fce1eb845c1f57387")
      recipe.name.must_equal "Dinner Tonight: Rice Salad with Pesto and Shrimp"
    end

    it "Returns false for an invalid channel id" do
      recipe = EdamamApiWrapper.getRecipe("hat")
      recipe.must_be_nil
    end

  end

end
