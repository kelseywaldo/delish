require "test_helper"

describe HomepagesController do

  before do
    VCR.insert_cassette("slack")
  end

  after do
    VCR.eject_cassette("slack")
  end

  it "should get index" do
    get root_path
    must_respond_with :success
  end

  it "a search should redirect to the recipes list page" do

  end

  it "should save the search term as a parameter" do

  end

end
