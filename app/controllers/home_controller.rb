class HomeController < ApplicationController
  def index
    @applications = Application.enabled.includes(:icon).order(:position)
    @categories = Category.enabled.includes(:bookmarks).order(:position)
  end

  def preview
    Current.icon_color = params.expect(:color)

    index
  end
end
