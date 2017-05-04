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


    it "Will return an empty array with an invalid URI" do
      recipes = EdamamApiWrapper.getRecipeList("Bad token")
      recipes.must_equal []
    end

  end

  describe "self.getRecipe(uri)" do

    it "Can get a recipe given a valid uri" do
      recipe = EdamamApiWrapper.getRecipe(name: "name", uri: "http://www.edamam.com/ontologies/edamam.owl%23recipe_bef69a5e3324f42fce1eb845c1f57387")
      recipe.name.must_equal "Dinner Tonight: Rice Salad with Pesto and Shrimp"
    end

    it "Returns false for an invalid channel id" do
      EdamamApiWrapper.getRecipe("hat")
      must_respond_with :bad_request
    end

  end

end
