# frozen_string_literal: true

module DaisyHelper
  def tooltip_tag(tip, position: :top, **opts, &)
    content_tag(
      :div,
      class: class_names("tooltip tooltip-#{position}", opts[:class]),
      data: { tip: }.merge(opts[:data] || {}),
      **opts.except(:class, :data),
      &
    )
  end

  def notice_tag(type, message, duration: 1000, **opts)
    data = { controller: "notice", notice_duration_value: duration, turbo_permanent: true }

    # A unique ID is required so Turbo does not merge notices when morphing.
    content_tag(
      :div,
      id: "OAK#{SecureRandom.base58}",
      class: class_names("notice notice-#{type}", opts[:class]),
      data: data.merge(opts[:data] || {})
    ) do
      tag.span(message)
    end
  end
end
