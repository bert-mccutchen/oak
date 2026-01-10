class ImportsController < ApplicationController
  def new
    @import = Import.new
  end

  def create
    @import = Import.new(import_params)

    if @import.process
      redirect_to root_path, success: "Import complete."
    else
      render :new, status: :unprocessable_content
    end
  end

  private

  def import_params
    params.expect(import: %i[host])
  end
end
