class ThemesController < ApplicationController
  before_action :set_theme, only: %i[show edit update destroy]

  def index
    @themes = Theme.all.order(:name)
  end

  def show
    redirect_to themes_path
  end

  def new
    @theme = Theme.new(clone_attributes)
    Current.theme = @theme
  end

  def edit
    Current.theme = @theme
  end

  def create
    @theme = Theme.new(theme_params)

    if @theme.save
      redirect_to @theme, success: "Theme created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @theme.update(theme_params)
      redirect_to @theme, success: "Theme updated.", status: :see_other
    else
      Rails.logger.error(@theme.errors.full_messages)
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @theme.destroy!

    redirect_back fallback_location: themes_path, warning: "Theme destroyed.", status: :see_other
  end

  private

  def set_theme
    @theme = Theme.find_by!(token: params.expect(:token))
  end

  def theme_params
    params.expect(theme: %i[
      name
      color_scheme
      color_base_100 color_base_200 color_base_300 color_base_content
      color_primary color_primary_content
      color_secondary color_secondary_content
      color_accent color_accent_content
      color_neutral color_neutral_content
      color_info color_info_content
      color_success color_success_content
      color_warning color_warning_content
      color_error color_error_content
      radius_selector radius_field radius_box
      size_selector size_field
      border
      depth noise
      enabled
    ])
  end

  def clone_attributes
    base_theme = Theme.find_by(token: params[:clone]) || Current.theme

    {
      name: "New Theme",
      **base_theme.slice(%i[
        color_scheme
        color_base_100 color_base_200 color_base_300 color_base_content
        color_primary color_primary_content
        color_secondary color_secondary_content
        color_accent color_accent_content
        color_neutral color_neutral_content
        color_info color_info_content
        color_success color_success_content
        color_warning color_warning_content
        color_error color_error_content
        radius_selector radius_field radius_box
        size_selector size_field
        border
        depth noise
      ])
    }
  end
end
