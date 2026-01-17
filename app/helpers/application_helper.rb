# frozen_string_literal: true

module ApplicationHelper
  def current_controller?(name)
    controller_name == name.to_s
  end

  def ios?
    /(iPhone|iPad|iPod|CriOS)/.match?(request.user_agent)
  end
end
