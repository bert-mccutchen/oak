class DaisyFormBuilder < ActionView::Helpers::FormBuilder
  delegate :tag, :safe_join, :token_list, to: :@template

  def label(method, content_or_options = nil, options = {}, &)
    if content_or_options.is_a?(Hash)
      content_or_options[:class] = token_list(content_or_options[:class], "label")
    else
      options[:class] = token_list(options[:class], "label")
    end

    super
  end

  def check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
    options[:class] = token_list(options[:class], "toggle toggle-primary")
    options[:include_hidden] = false

    safe_join [
      hidden_field(:enabled, id: self.field_id(method), value: 0),
      super
    ]
  end

  def range_field(method, options = {})
    options[:class] = token_list(options[:class], "range")
    super
  end

  def url_field(method, options = {})
    options[:class] = token_list(options[:class], "input")
    super
  end

  def number_field(method, options = {})
    options[:class] = token_list(options[:class], "input")
    super
  end

  def text_field(method, options = {})
    options[:class] = token_list(options[:class], "input")
    super
  end

  def text_area(method, options = {})
    options[:class] = token_list(options[:class], "textarea")
    super
  end

  def select(method, choices = nil, options = {}, html_options = {}, &)
    html_options[:class] = token_list(html_options[:class], "select")
    super
  end

  def collection_select(method, collection, value_method, text_method, options = {}, html_options = {}, &)
    html_options[:class] = token_list(html_options[:class], "select")
    super
  end

  def oklch_field(method, options = {})
    render_view_component(OklchPickerFormComponent.new(self, @object, method, options))
  end

  def icon_field(method, options = {})
    render_view_component(IconPickerFormComponent.new(self, @object, method, options))
  end

  private

  def render_view_component(component)
    ApplicationController.renderer.render(component, layout: false)
  end
end

ActionView::Base.default_form_builder = DaisyFormBuilder
ENV["RANSACK_FORM_BUILDER"] = ActionView::Base.default_form_builder.name if defined?(Ransack)
