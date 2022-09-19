# frozen_string_literal: true

class DoctorDecorator < Draper::Decorator
  delegate_all

  def specialty
    object.specialty&.name
  end

  def image_url
    picture&.image_url || Picture::NO_IMAGE
  end

  def seniority
    DateTime.now.year - experience_at.year if experience_at
  end

  def open_appointments
    appointments.select { |appointment| appointment.recommendation.nil? }
  end
end
