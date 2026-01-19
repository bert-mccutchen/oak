# frozen_string_literal: true

require_relative "daisy_helper"
require_relative "font_awesome_helper"

module WeatherHelper
  include DaisyHelper
  include FontAwesomeHelper

  def temperature_tag(**opts)
    return unless Setting[:weather_enabled]

    content_tag(:span, **opts) do
      "#{current_conditions&.temperature_2m || "— "}#{temperature_unit}"
    end
  end

  def weather_icon_tag(**opts)
    return unless Setting[:weather_enabled]

    tooltip_tag(weather_icon_title, position: :bottom, **opts) do
      solid_icon_tag(weather_icon)
    end
  end

  private

  def current_conditions
    @current_conditions ||= WeatherService.current
  rescue StandardError => e
    Rails.logger.error(e.full_message)
    nil
  end

  def temperature_unit
    case Setting[:temperature_unit]
    when "fahrenheit"
      "°F"
    else
      "°C"
    end
  end

  def weather_icon
    return "wifi" unless current_conditions

    icon =
      case current_conditions.weather_code_symbol
      when :clear_sky
        Current.daytime? ? :sun : :moon
      when :mainly_clear, :partly_cloudy
        Current.daytime? ? :cloud_sun : :cloud_moon
      when :overcast
        :cloud
      when :fog, :depositing_rime_fog
        :smog
      when :drizzle_light, :freezing_drizzle_light, :rain_slight, :freezing_rain_slight, :rain_showers_slight
        :cloud_rain
      when :drizzle_moderate, :rain_moderate, :rain_showers_moderate
        :cloud_showers_heavy
      when :drizzle_dense, :freezing_drizzle_dense, :rain_heavy, :freezing_rain_heavy, :rain_showers_violent
        :cloud_showers_water
      when :snow_slight, :snow_moderate, :snow_heavy, :snow_grains, :snow_showers_slight, :snow_showers_heavy
        :snowflake
      when :thunderstorm_slight_or_moderate, :thunderstorm_with_slight_hail, :thunderstorm_with_heavy_hail
        :cloud_bolt
      end

    icon.to_s.dasherize
  end

  def weather_icon_title
    return "Network error, check logs." unless current_conditions

    current_conditions.weather_code_symbol.to_s.titleize
  end
end
