class HomeController < ApplicationController
  def index
    @applications = Application.includes(icon_variant: :icon).order(:position)
    @categories = Category.all.includes(:bookmarks).order(:position)
  end
end
