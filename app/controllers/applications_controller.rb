class ApplicationsController < ApplicationController
  before_action :set_application, only: %i[show edit update destroy]

  def index
    @applications = Application.all.order(:position)
  end

  def show
    redirect_to applications_path(anchor: @application.token)
  end

  def new
    @application = Application.new
  end

  def edit
  end

  def create
    @application = Application.new(application_params)

    if @application.save
      redirect_to @application, success: "Application created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @application.update(application_params)
      redirect_to @application, success: "Application updated.", status: :see_other
    else
      Rails.logger.error(@application.errors.full_messages)
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @application.destroy!

    redirect_back fallback_location: applications_path, warning: "Application destroyed.", status: :see_other
  end

  private

  def set_application
    @application = Application.find_by!(token: params.expect(:token))
  end

  def application_params
    params.expect(application: %i[icon_id name description url position])
  end
end
