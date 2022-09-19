# frozen_string_literal: true

class AppointmentPresenter < ApplicationPresenter
  def completed?
    (@model.recommendation.present? && @view.user_signed_in?) ||
      (@model.recommendation.blank? && @view.doctor_signed_in?)
  end

  def unreviewed?
    (@model.recommendation&.unreviewed? && @view.user_signed_in?) ||
      (@model.recommendation.blank? && @view.doctor_signed_in?)
  end
end
