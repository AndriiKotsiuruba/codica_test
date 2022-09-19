# frozen_string_literal: true

class AppointmentsController < ApplicationController
  load_and_authorize_resource param_method: :require_params

  before_action :set_doctor, only: %i[new create]

  def index
    @pagy, @appointments = pagy(@appointments)
    @appointments = @appointments.decorate
  end

  def show
    @appointment = @appointment.decorate
    @appointment.recommendation ? recommendations_viewed : build_recommendation
  end

  def new
    @appointment = @doctor.appointments.new(require_params).decorate
  end

  def create
    @appointment = Appointment.new(user: current_user, doctor: @doctor)
    appointment_form = AppointmentForm.new(@appointment)
    if appointment_form.validate(require_params)
      appointment_form.save
      redirect_to @appointment, notice: t(".success")
    else
      redirect_to doctor_path(@doctor, start_date: @appointment.start_time),
                  alert: ReformErrors.to_human_readable(appointment_form.errors)
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find_by(id: params[:doctor_id])
  end

  def require_params
    params.require(:appointment).permit(:start_time, :end_time, :full_name, :symptoms)
  end

  def recommendations_viewed
    return if !@appointment.recommendation&.unreviewed || doctor_signed_in?

    @appointment.recommendation.update(unreviewed: false)
  end

  def build_recommendation
    return unless can? :create, Recommendation

    Recommendation.new(appointment: @appointment)
  end
end
