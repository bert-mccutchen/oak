module FlameApiHelper
  FLAME_APPS_RESPONSE = {
    "success": true,
    "data": [
      {
        "name": "Home Assistant",
        "description": "Home Automation",
        "url": "http://home.local",
        "orderId": 2
      },
      {
        "name": "Unknown Application",
        "url": "http://unknown.local",
        "orderId": 1
      }
    ]
  }

  FLAME_CATEGORIES_RESPONSE = {
    "success": true,
    "data": [
      {
        "name": "Books",
        "orderId": 2,
        "bookmarks": [
          {
            "name": "Fahrenheit 451",
            "url": "https://en.wikipedia.org/wiki/Fahrenheit_451",
            "orderId": 3
          },
          {
            "name": "Nineteen Eighty-Four",
            "url": "https://en.wikipedia.org/wiki/Nineteen_Eighty-Four",
            "orderId": 2
          },
          {
            "name": "Animal Farm",
            "url": "https://en.wikipedia.org/wiki/Animal_Farm",
            "orderId": 1
          }
        ]
      },
      {
        "name": "Movies",
        "orderId": 1,
        "bookmarks": [
          {
            "name": "Ghost in the Shell",
            "url": "https://en.wikipedia.org/wiki/Ghost_in_the_Shell",
            "orderId": 2
          },
          {
            "name": "Gattaca",
            "url": "https://en.wikipedia.org/wiki/Gattaca",
            "orderId": 1
          }
        ]
      }
    ]
  }

  def stub_flame_api
    stub_request(:get, /http:\/\/flame.local\/api\/apps/)
      .to_return(status: 200, body: FLAME_APPS_RESPONSE.to_json)

    stub_request(:get, /http:\/\/flame.local\/api\/categories/)
      .to_return(status: 200, body: FLAME_CATEGORIES_RESPONSE.to_json)
  end

  def stub_flame_api_error
    stub_request(:get, /http:\/\/flame.local\/api\/apps/).to_return(status: 404, body: "")
  end
end

class ActionDispatch::IntegrationTest
  include FlameApiHelper
end
