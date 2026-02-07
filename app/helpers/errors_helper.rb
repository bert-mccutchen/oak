# frozen_string_literal: true

module ErrorsHelper
  def handle_error(error, status:)
    Rails.logger.error(error.full_message)
    raise if Rails.env.development?

    redirect_to error_path(status), status:
  end

  def error_message(status:)
    # Rack doesn't support the best status code by default!
    return "I'm a teapot" if status == 418

    Rack::Utils::HTTP_STATUS_CODES[status]
  end
end
