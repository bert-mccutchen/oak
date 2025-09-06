class IconsController < ApplicationController
  include IconsHelper

  def show
    respond_to do |format|
      format.svg do
        send_data colorize_svg(icon_variant), content_type: "image/svg+xml", disposition: "inline"
      end
      format.png do
        send_data colorize_png(icon_variant), type: "image/png", disposition: "inline"
      end
      format.any do
        head :not_acceptable
      end
    end
  end

  private

  def icon_params
    params.permit(:slug, :format, :color)
  end

  def icon_variant
    @icon ||= IconVariant.joins(:icon).where(
      icon: { slug: params.expect(:slug) },
      format: params.expect(:format),
      theme: %i[light dark default]
    ).order(theme: :desc).first!
  end
end
