require "test_helper"

describe HomepagesController do
  it "should get index" do
    get root_path
    value(response).must_be :success?
  end

  it "a search should redirect to the recipes list page" do

  end

  it "" do

  end

end
