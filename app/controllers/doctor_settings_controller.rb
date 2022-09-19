# frozen_string_literal: true

class DoctorSettingsController < DeviseSettingsController
  before_action :authenticate_doctor!
  before_action :build_picture
  before_action :set_tab

  private

  def resource
    @resource ||= current_doctor
  end

  def resource_edit_path
    doctor_settings_path
  end

  def require_params
    params.require(:doctor).permit(:phone_number, :verification_code,
                                   :current_password, :password,
                                   :password_confirmation, :destroy_confirmation,
                                   :full_name, :description, :specialty_id, :experience_at,
                                   :start_work_schedule, :end_work_schedule,
                                   :start_lunch_break, :end_lunch_break,
                                   :duration_appointments,
                                   :monday_off, :tuesday_off, :wednesday_off, :thursday_off,
                                   :friday_off, :saturday_off, :sunday_off,
                                   picture_attributes: {})
  end

  def set_tab
    @tab = :personal
    return unless params[:doctor]

    if require_params[:phone_number] || require_params[:current_password] || require_params[:destroy_confirmation]
      @tab = :privacy
    end
    @tab = :schedule if require_params[:start_work_schedule]
  end

  def build_picture
    resource.picture ||= Picture.new
  end
end
