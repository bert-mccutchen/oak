module ErrorsHelper
  def handle_error(error, status:)
    Rails.logger.error(error.full_message)
    puts error.full_message if ENV["CI"].present?
    raise if Rails.env.development?

    redirect_to error_path(status), status:
  end

  def error_message(status:)
    # Rack doesn't support the best status code by default!
    return "I'm a teapot" if status == 418

    Rack::Utils::HTTP_STATUS_CODES[status]
  end
end
