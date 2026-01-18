require "test_helper"

class ApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @application = applications(:unifi)
    @application_params = {
      icon_id: icons(:dokploy).id,
      name: "Dokploy",
      url: "https://dokploy.local",
      position: 2
    }
  end

  test "should get index" do
    get applications_url

    assert_response :success
  end

  test "should get new" do
    get new_application_url

    assert_response :success
  end

  test "should create the application" do
    assert_difference("Application.count", 1) do
      post applications_url, params: { application: @application_params }
    end

    assert_redirected_to application_url(Application.last)
    assert_flash :success, "Application created."
    assert_attributes_contain(Application.last, @application_params)
  end

  test "should redirect to index with an anchor" do
    get application_url(@application)

    assert_redirected_to applications_path
  end

  test "should get edit" do
    get edit_application_url(@application)

    assert_response :success
  end

  test "should update the application" do
    patch application_url(@application), params: { application: @application_params }

    assert_redirected_to application_url(@application)
    assert_flash :success, "Application updated."
    assert_attributes_contain(@application.reload, @application_params)
  end

  test "should destroy the application" do
    assert_difference("Application.count", -1) do
      delete application_url(@application)
    end

    assert_redirected_to applications_url
    assert_flash :warning, "Application destroyed."
  end
end
