ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "minitest/mock"
require "webmock/minitest"

# SimpleCov does not work with parallel workers by default.
# So we will just disable it unless we want to get coverage stats.
if ENV["COVERAGE"].present?
  require "simplecov"
  SimpleCov.start(:rails)
end

WebMock.disable_net_connect!(allow_localhost: true)

Dir[Rails.root.join("test", "test_helpers", "**", "*.rb")].each { |file| require file }

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors) unless const_defined?(:SimpleCov)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
