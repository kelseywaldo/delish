require "test_helper"

describe RecipesController do

  before do
    VCR.insert_cassette("edamam")
  end

  after do
    VCR.eject_cassette("edamam")
  end

  describe "index" do

    it "should get index" do
      get root_path
      must_respond_with :success
    end

  end

  describe "show" do

    it "should show recipe page " do
      get recipe_path(name: "name", uri: "http://www.edamam.com/ontologies/edamam.owl%23recipe_bef69a5e3324f42fce1eb845c1f57387")
      must_respond_with :success
    end

  end

end
