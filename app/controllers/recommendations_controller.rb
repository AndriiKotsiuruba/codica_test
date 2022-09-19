# frozen_string_literal: true

class RecommendationsController < ApplicationController
  before_action :set_appointment, only: %i[create]

  def create
    authorize! :create, Recommendation
    @recommendation = Recommendation.new(appointment: @appointment)
    recommendation_form = RecommendationForm.new(@recommendation)

    if recommendation_form.validate(params[:recommendation])
      recommendation_form.save
      redirect_to @appointment, notice: t(".success")
    else
      redirect_to @appointment, alert: ReformErrors.to_human_readable(recommendation_form.errors)
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find_by(id: params.dig(:recommendation, :appointment_id))
  end
end
