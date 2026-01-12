class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[show edit update destroy]
  before_action :set_category, only: %i[new]

  def index
    @categories = Category.all.includes(:bookmarks).order(:position)
  end

  def show
    redirect_to bookmarks_path(anchor: @bookmark.token)
  end

  def new
    @bookmark = Bookmark.new(category: @category)
  end

  def edit
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      redirect_to @bookmark, success: "Bookmark created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark, success: "Bookmark updated.", status: :see_other
    else
      Rails.logger.error(@bookmark.errors.full_messages)
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @bookmark.destroy!

    redirect_back fallback_location: bookmarks_path, warning: "Bookmark destroyed.", status: :see_other
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find_by!(token: params.expect(:token))
  end

  def set_category
    @category = Category.find_by(token: params[:category])
  end

  def bookmark_params
    params.expect(bookmark: %i[category_id name url position])
  end
end
