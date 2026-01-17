# frozen_string_literal: true

require "securerandom"

class OklchPickerFormComponent < ViewComponent::Base
  BUTTON_CLASSES = %w[btn w-full border border-base-content/20]

  def initialize(form, object, method, options = {})
    @form = form
    @object = object
    @method = method
    @value = object.public_send(@method)
    @options = options
  end

  def button_content
    @options[:label]
  end

  def button_classes
    class_names(BUTTON_CLASSES, @options[:class])
  end

  def range_field(in:, step:, target:)
    @form.range_field(
      "slider_#{SecureRandom.base58}", in:, step:, class: "w-full sm:w-auto flex-grow",
      data: { oklch_picker_form_target: target, action: "oklch-picker-form##{target}" }
    )
  end

  def number_field(in:, step:, target:)
    @form.number_field(
      "input_#{SecureRandom.base58}", in:, step:, class: "w-full sm:w-auto bg-white/10",
      data: { oklch_picker_form_target: target, action: "oklch-picker-form##{target}" }
    )
  end
end
