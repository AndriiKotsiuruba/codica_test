# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  helper_method :specialtys

  private

  def current_ability
    @current_ability ||= Ability.new(current_user || current_doctor)
  end

  def specialtys
    Rails.cache.fetch("all_specialtys") { Specialty.all }
  end
end
