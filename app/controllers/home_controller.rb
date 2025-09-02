class HomeController < ApplicationController
  def index
    @greeting = GreetingService.current
    @quote = Quote.daily_pick
    @applications = Application.all.order(:position)
    @categories = Category.all.includes(:bookmarks).order(:position)
  end
end
