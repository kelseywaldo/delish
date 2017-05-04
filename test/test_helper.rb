ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/reporters"  # for Colorized output
require 'vcr'
require 'webmock/minitest'

#  For colorful output!
Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)


# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
  VCR.configure do | config |
    # set folder where we are storing cassettes
    config.cassette_library_dir = 'test/cassettes'

    # tells VCR to use Webmock
    config.hook_into :webmock

    # if we don't have a cassette for this, record a new one
    # determines which cassette to use, based on the HTTP verb, uri, body
    config.default_cassette_options = {
      record: :new_episodes,
      match_requests_on: [:method, :uri, :body]
    }

    # hides the slack token from being published on github
    config.filter_sensitive_data("<EDAMAM_ID>") do
      ENV["EDAMAM_ID"]
    end

    config.filter_sensitive_data("<EDAMAM_KEY>") do
      ENV["EDAMAM_KEY"]
    end
  end
end
