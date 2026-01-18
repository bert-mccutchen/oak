require_relative "daisy_helper"
require_relative "font_awesome_helper"

module SortHelper
  include DaisyHelper
  include FontAwesomeHelper

  def sortable_grip_tag(resource)
    return unless resource.try(:positionable?)

    content_tag(:div, class: "flex cursor-grab") do
      solid_icon_tag("grip-vertical")
    end
  end

  def sort_toggle_tag(resource)
    setting = sort_setting(resource)
    return unless setting

    if setting.parsed_value == "position"
      sort_alphabetically_tag(setting)
    else
      sort_numerically_tag(setting)
    end
  end

  private

  def sort_setting(resource)
    Setting.find_by(slug: "#{resource.model_name.plural}_order")
  end

  def sort_alphabetically_tag(setting)
    tooltip_tag("Sort Alphabetically", position: :bottom) do
      button_to(setting, method: :patch, params: { setting: { value: "name" } }, class: "btn btn-soft btn-secondary") do
        solid_icon_tag("arrow-down-a-z")
      end
    end
  end

  def sort_numerically_tag(setting)
    tooltip_tag("Sort Numerically", position: :bottom) do
      button_to(setting, method: :patch, params: { setting: { value: "position" } }, class: "btn btn-soft btn-secondary") do
        solid_icon_tag("arrow-down-1-9")
      end
    end
  end
end
