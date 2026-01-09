class SearchesController < ApplicationController
  def show
    @q = applications.ransack(params[:q])
    @q.sorts = "name asc" if @q.sorts.empty?
    @applications = @q.result

    @q = bookmarks.ransack(params[:q])
    @q.sorts = "name asc" if @q.sorts.empty?
    @bookmarks = @q.result
  end

  private

  def query?
    params[:q].present? && params[:q].values.compact_blank.any?
  end

  def applications
    query? ? Application.all : Application.none
  end

  def bookmarks
    query? ? Bookmark.all : Bookmark.none
  end
end
