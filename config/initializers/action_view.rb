ActionView::Base.field_error_proc = proc do |html_tag, instance|
  if /^<input/.match?(html_tag)
    error_label = tag.div(class: "label") do
      tag.label(instance.error_message.to_sentence, class: "label-text-alt text-error text-wrap")
    end

    safe_join [ html_tag, error_label ]
  else
    html_tag
  end
end
