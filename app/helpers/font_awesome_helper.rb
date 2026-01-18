# frozen_string_literal: true

module FontAwesomeHelper
  include InlineSvg::ActionView::Helpers

  FALLBACK_ICON = "font_awesome/file-circle-question-solid-full.svg"

  def font_awesome_icon_tag(name, variant = :regular, **opts)
    inline_svg_tag(
      "font_awesome/#{name.dasherize}-#{variant}-full.svg",
      class: class_names("fa-#{name.dasherize} box-content inline-block size-[1.25em] fill-current align-[-0.25em]", opts[:class]),
      fallback: FALLBACK_ICON,
      **opts.except(:class)
    )
  end

  def regular_icon_tag(name, **opts)
    font_awesome_icon_tag(name, :regular, **opts)
  end

  def solid_icon_tag(name, **opts)
    font_awesome_icon_tag(name, :solid, **opts)
  end
end
