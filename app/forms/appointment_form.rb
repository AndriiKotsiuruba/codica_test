# frozen_string_literal: true

class AppointmentForm < FormWithDryValidations
  property :start_time
  property :end_time
  property :full_name
  property :symptoms
  property :user
  property :doctor

  MAX_OPEN_APPOINTMENTS = 10
  validation do
    params do
      required(:start_time).filled(:time)
      required(:end_time).filled(:time)
      required(:full_name).filled(:string)
      required(:symptoms).filled(:string)
      required(:user).filled
      required(:doctor).filled
    end

    rule(:start_time) do
      if  time_to_i(value) >= time_to_i(values[:end_time]) ||
          time_to_i(value) < time_to_i(values[:doctor].start_work_schedule) || (
            time_to_i(value) >= time_to_i(values[:doctor].start_lunch_break) &&
            time_to_i(value) < time_to_i(values[:doctor].end_lunch_break)
          )
        key.failure(I18n.t("form.appointment.invalid_time"))
      end
    end

    rule(:end_time) do
      if time_to_i(value) > time_to_i(values[:doctor].end_work_schedule) || (
            time_to_i(value) >= time_to_i(values[:doctor].start_lunch_break) &&
            time_to_i(value) < time_to_i(values[:doctor].end_lunch_break)
          )
        key.failure(I18n.t("form.appointment.invalid_time"))
      end
    end

    rule(:doctor) do
      if value.decorate.open_appointments.size >= MAX_OPEN_APPOINTMENTS
        key.failure(I18n.t("form.appointment.size_open_appointments", size: MAX_OPEN_APPOINTMENTS))
      end
    end

    def time_to_i(datetime)
      return 0 if datetime.nil?

      (datetime.hour * 60) + datetime.min
    end
  end
end
