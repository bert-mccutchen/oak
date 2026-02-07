# frozen_string_literal: true

class ErrorsController < ApplicationController
  before_action :set_status_code, only: [ :show ]

  def show
    respond_to do |format|
      format.html { render status: @status_code }
      format.all { head @status_code }
    end
  end

  private

  def set_status_code
    @status_code = params[:code]&.to_i || 500
  end
end
