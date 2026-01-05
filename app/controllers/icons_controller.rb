class IconsController < ApplicationController
  include IconsHelper

  def index
    @q = Icon.ransack(params[:q])
    @q.sorts = "name asc" if @q.sorts.empty?
    @pagy, @icons = pagy(:offset, @q.result, **pagy_options)
  end

  def show
    respond_to do |format|
      format.svg do
        send_data colorize_svg(icon_variant, color_param), type: :svg, disposition: :inline
      end
      format.png do
        send_data colorize_png(icon_variant, color_param), type: :png, disposition: :inline
      end
      format.any do
        head :not_acceptable
      end
    end
  end

  private

  def color_param
    params[:color]
  end

  def icon_variant
    @icon_variant ||= IconVariant.joins(:icon).where(
      icon: { slug: params.expect(:slug) },
      format: params.expect(:format)
    ).order(:theme).first!
  end
end
