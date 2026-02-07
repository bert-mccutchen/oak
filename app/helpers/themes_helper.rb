# frozen_string_literal: true

module ThemesHelper
  ELEMENT_SIZES = {
    0.1875 => "",
    0.21875 => "",
    0.25 => "",
    0.28125 => "",
    0.3125 => ""
  }

  SELECTORS_RADIUSES = {
    0.0 => "rounded-[0rem]",
    0.25 => "rounded-[0.25rem]",
    0.5 => "rounded-[0.5rem]",
    0.75 => "rounded-[0.75rem]",
    1.0 => "rounded-[1rem]"
  }

  FIELDS_RADIUSES = {
    0.0 => "rounded-[0rem]",
    0.5 => "rounded-[0.5rem]",
    1.0 => "rounded-[1rem]",
    1.25 => "rounded-[1.25rem]",
    1.5 => "rounded-[1.5rem]"
  }

  BOX_RADIUSES = {
    0.0 => "rounded-[0rem]",
    0.5 => "rounded-[0.5rem]",
    1.0 => "rounded-[1rem]",
    1.5 => "rounded-[1.5rem]",
    2.0 => "rounded-[2rem]"
  }

  def theme_stylesheet_tag(theme, **opts)
    content_tag(:style, type: "text/css", id: dom_id(theme, :styles)) do
      ":root:has(input.theme-controller[value=\"#{theme.token}\"]:checked)," \
        "[data-theme=\"#{theme.token}\"] {#{css_vars(theme).join(";")}}".html_safe
    end
  end

  private

  def attributes_to_css(theme, *attrs, type: "", prefix: "--", &block)
    var_prefix = prefix == :none ? "" : prefix

    attrs.map do |attr|
      value = block ? block.call(theme.send(attr)) : theme.send(attr)
      "#{var_prefix}#{attr.to_s.dasherize}: #{value}#{type}"
    end
  end

  def css_vars(theme)
    [
      *attributes_to_css(theme, :color_scheme, prefix: :none),
      *attributes_to_css(theme, :color_base_100, :color_base_200, :color_base_300, :color_base_content),
      *attributes_to_css(theme, :color_primary, :color_primary_content),
      *attributes_to_css(theme, :color_secondary, :color_secondary_content),
      *attributes_to_css(theme, :color_accent, :color_accent_content),
      *attributes_to_css(theme, :color_neutral, :color_neutral_content),
      *attributes_to_css(theme, :color_info, :color_info_content),
      *attributes_to_css(theme, :color_success, :color_success_content),
      *attributes_to_css(theme, :color_warning, :color_warning_content),
      *attributes_to_css(theme, :color_error, :color_error_content),
      *attributes_to_css(theme, :radius_selector, :radius_field, :radius_box, type: :rem),
      *attributes_to_css(theme, :size_selector, :size_field, type: :rem),
      *attributes_to_css(theme, :border, type: :px),
      *attributes_to_css(theme, :depth, :noise) { it ? 1 : 0 }
    ]
  end
end
