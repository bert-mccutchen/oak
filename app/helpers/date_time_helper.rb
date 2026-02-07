# frozen_string_literal: true

module DateTimeHelper
  def date_tag(**opts)
    return unless Setting[:date_enabled]

    content_tag(:span, **opts.reverse_merge(data: date_time_controller(:date_format))) do
      Time.current.strftime(Setting[:date_format])
    end
  end

  def time_tag(**opts)
    return unless Setting[:time_enabled]

    content_tag(:span, **opts.reverse_merge(data: date_time_controller(:time_format))) do
      Time.current.strftime(Setting[:time_format])
    end
  end

  private

  def date_time_controller(format)
    {
      controller: "date-time",
      date_time_time_zone_value: time_zone_offset,
      date_time_format_value: Setting[format]
    }
  end

  def time_zone_offset
    ActiveSupport::TimeZone[Setting[:time_zone]].formatted_offset
  end
end
