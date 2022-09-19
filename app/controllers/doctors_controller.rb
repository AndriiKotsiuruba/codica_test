# frozen_string_literal: true

class DoctorsController < ApplicationController
  load_and_authorize_resource

  def index
    @pagy, @doctors = pagy_countless(DoctorsQuery.new.call(@doctors, filter_params).decorate,
                                     link_extra: 'data-remote="true"')
  end

  def show
    @doctor = @doctor.decorate
    start_date = params.fetch(:start_date, Time.zone.today).to_date
    @work_hours = WorkScheduleServices::Build.call(@doctor, start_date) if can? :create, Appointment
  end

  private

  def filter_params
    params.permit(:specialty)
  end
end
