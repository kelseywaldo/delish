require "test_helper"

describe RecipesController do
  it "should get index" do
    get recipes_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get recipes_show_url
    value(response).must_be :success?
  end

end
