require "test_helper"

class QuoteTest < ActiveSupport::TestCase
  setup do
    @quote = Quote.new(
      quote: "Test",
      author: "Test"
    )
  end

  test "quotes are generated with Turbo-safe tokens" do
    assert_match (/\A[a-zA-Z]+/), @quote.token
  end

  test "quotes identify by their token" do
    assert_equal @quote.to_param, @quote.token
    assert_equal @quote.to_key, [ @quote.token ]
  end

  test "validates successfully" do
    assert @quote.valid?
  end

  test "validates token presence" do
    @quote.token = nil

    assert_not @quote.valid?
  end

  test "validates quote presence" do
    @quote.quote = nil

    assert_not @quote.valid?
  end

  test "validates author presence" do
    @quote.author = nil

    assert_not @quote.valid?
  end
end
