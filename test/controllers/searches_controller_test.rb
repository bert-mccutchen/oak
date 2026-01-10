require "test_helper"

class SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should not return results without a query" do
    get search_url

    assert_response :success
    assert_dom "turbo-frame#search > ul > li", count: 0
  end

  test "should not return results with a query that has no matches" do
    get search_url(q: { name_cont: "NOOP" })

    assert_response :success
    assert_dom "turbo-frame#search > ul > li", count: 0
  end

  test "should return results with a query that has multiple matches" do
    get search_url(q: { name_cont: "u" })

    assert_response :success
    assert_dom "turbo-frame#search > ul > li", count: 3
  end

  test "should return results with a query that has just application matches" do
    get search_url(q: { name_cont: "unifi" })

    assert_response :success
    assert_dom "turbo-frame#search > ul > li", count: 1
    assert_dom "turbo-frame#search > ul > li > a[href=?]", "https://unifi/login"
  end

  test "should return results with a query that has just bookmark matches" do
    get search_url(q: { name_cont: "ruby" })

    assert_response :success
    assert_dom "turbo-frame#search > ul > li", count: 1
    assert_dom "turbo-frame#search > ul > li > a[href=?]", "https://www.ruby-lang.org"
  end
end
