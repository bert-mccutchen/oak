# frozen_string_literal: true

class SettingsController < ApplicationController
   before_action :set_setting, only: %i[update]

  def index
  end

  def update
    if @setting.update(setting_params)
      redirect_back fallback_location: root_path, success: "Setting updated.", status: :see_other
    else
      Rails.logger.error(@setting.errors.full_messages)
      render :index, status: :unprocessable_content
    end
  end

  private

  def set_setting
    @setting = Setting.find_by!(slug: params.expect(:slug))
  end

  def setting_params
    params.expect(setting: %i[value])
  end
end
