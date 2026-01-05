class HomeController < ApplicationController
  def index
    @applications = Application.includes(:icon).order(:position)
    @categories = Category.all.includes(:bookmarks).order(:position)
  end

  def preview
    Current.icon_color = params.expect(:color)

    index
  end
end
