module OpenMeteoHelper
  OPEN_METEO_RESPONSE = {
    current: {
      weather_code: 0,
      temperature_2m: 0
    }
  }

  def stub_weather
    stub_request(:get, /api.open-meteo.com/)
      .to_return(status: 200, body: OPEN_METEO_RESPONSE.to_json)
  end
end

class ActionDispatch::IntegrationTest
  include OpenMeteoHelper
end
