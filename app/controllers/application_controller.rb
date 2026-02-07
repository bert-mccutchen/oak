# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Method
  include ErrorsHelper

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  around_action :set_time_zone

  add_flash_types :info, :success, :warning, :error

  rescue_from StandardError do |error|
    handle_error(error, status: 500)
  end

  rescue_from ActionController::ParameterMissing do |error|
    handle_error(error, status: 400)
  end

  rescue_from ActiveRecord::RecordNotFound do |error|
    handle_error(error, status: 404)
  end

  protected

  def pagy_options
    { page: params.expect(:page), limit: 10 }
  rescue ActionController::ParameterMissing
    { page: 1, limit: 10 }
  end

  private

  def set_time_zone(&block)
    Time.use_zone(Setting[:time_zone], &block)
  end
end
