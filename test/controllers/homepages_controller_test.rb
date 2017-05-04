require "test_helper"

describe HomepagesController do

  before do
    VCR.insert_cassette("edamam")
  end

  after do
    VCR.eject_cassette("edamam")
  end

  it "should get index" do
    get root_path
    must_respond_with :success
  end

  it "should redirect to recipes index page after submiting a search term" do
    get recipes_path, params: { from: 0, to: 10, search: "apples"}
    must_respond_with :success
  end

end
