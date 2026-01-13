class HomeController < ApplicationController
  def index
    @applications = Application.enabled.includes(:icon).order(applications_order)
    @categories = Category.enabled.includes(:bookmarks).order(categories_order)
  end

  def preview
    Current.icon_color = params.expect(:color)

    index
  end

  private

  def applications_order
    Setting[:applications_order]
  end

  def categories_order
    Setting[:categories_order]
  end
end
