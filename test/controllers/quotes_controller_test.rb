require "test_helper"

class QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote = quotes(:life)
    @quote_params = {
      quote: "My momma always said life was like a box of chocolates. You never know what you're gonna get.",
      author: "Forrest Gump",
      position: 2
    }
  end

  test "should get index" do
    get quotes_url

    assert_response :success
  end

  test "should get new" do
    get new_quote_url

    assert_response :success
  end

  test "should create the quote" do
    assert_difference("Quote.count", 1) do
      post quotes_url, params: { quote: @quote_params }
    end

    assert_redirected_to quote_url(Quote.last)
    assert_flash :success, "Quote created."
    assert_attributes_contain(Quote.last, @quote_params)
  end

  test "should redirect to index with an anchor" do
    get quote_url(@quote)

    assert_redirected_to quotes_path
  end

  test "should get edit" do
    get edit_quote_url(@quote)

    assert_response :success
  end

  test "should update the quote" do
    patch quote_url(@quote), params: { quote: @quote_params }

    assert_redirected_to quote_url(@quote)
    assert_flash :success, "Quote updated."
    assert_attributes_contain(@quote.reload, @quote_params)
  end

  test "should destroy the quote" do
    assert_difference("Quote.count", -1) do
      delete quote_url(@quote)
    end

    assert_redirected_to quotes_url
    assert_flash :warning, "Quote destroyed."
  end

  test "should reroll the daily quote with a message" do
    Quote.first.update!(position: 2)

    Quote.stub :daily_pick, Quote.first do
      patch reroll_daily_quotes_url

      assert_flash :info, "You rolled a 2."
    end
  end

  test "should reroll the daily quote with a special message for a nat 1" do
    Quote.stub :daily_pick, Quote.first do
      patch reroll_daily_quotes_url

      assert_flash :info, "You rolled a natural 1!"
    end
  end

  test "should reroll the daily quote with a special message for a nat 20" do
    Quote.first.update!(position: 20)

    Quote.stub :daily_pick, Quote.first do
      patch reroll_daily_quotes_url

      assert_flash :info, "You rolled a natural 20!"
    end
  end
end
