class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all.order(categories_order)
  end

  def show
    redirect_to categories_path
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category, success: "Category created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @category.update(category_params)
      redirect_to @category, success: "Category updated.", status: :see_other
    else
      Rails.logger.error(@category.errors.full_messages)
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @category.destroy!

    redirect_back fallback_location: categories_path, warning: "Category destroyed.", status: :see_other
  end

  private

  def set_category
    @category = Category.find_by!(token: params.expect(:token))
  end

  def category_params
    params.expect(category: %i[name enabled position])
  end

  def categories_order
    Setting[:categories_order]
  end
end
