# frozen_string_literal: true

class AppointmentDecorator < Draper::Decorator
  delegate_all

  def duration_datetime
    "#{l start_time, format: :only_time} - #{l end_time}"
  end
end
