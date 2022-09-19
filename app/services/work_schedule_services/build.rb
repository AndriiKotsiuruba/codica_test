# frozen_string_literal: true

module WorkScheduleServices
  class Build < ApplicationService
    WDAY_DB = %i[sunday_off monday_off tuesday_off wednesday_off thursday_off friday_off saturday_off].freeze

    class WorkSchedule
      attr_reader :start_time, :end_time, :busy_time, :duration_time

      def initialize(start_time, end_time, busy_time, duration_time)
        @start_time = start_time
        @end_time = end_time
        @busy_time = busy_time
        @duration_time = duration_time
      end
    end

    def initialize(doctor, start_date)
      @doctor = doctor
      @start_date = start_date.beginning_of_week
      @res = []
    end

    def call
      7.times do
        start_time = @doctor.start_work_schedule
        end_time = @doctor.end_work_schedule
        while start_time < end_time
          @res << new_struct(@start_date, start_time)
          start_time += 60 * @doctor.duration_appointments
        end
        @start_date = @start_date.next_day
      end
      @res
    end

    private

    def concat_date_time(date, time)
      date.beginning_of_day + (time.to_datetime.hour * 60 * 60) + (time.to_datetime.minute * 60)
    end

    def new_struct(start_date, start_time)
      start_date_time = concat_date_time(start_date, start_time)
      end_time = start_date_time + (60 * @doctor.duration_appointments)
      busy_time = start_date_time < Time.zone.now ||
                  its_lunch_time?(start_time) ||
                  its_day_off?(start_date_time) ||
                  already_is_appointment?(start_date_time)
      duration_time = "#{I18n.l(start_date_time, format: :only_time)} - #{I18n.l(end_time, format: :only_time)}"

      WorkSchedule.new(start_date_time, end_time, busy_time, duration_time)
    end

    def its_lunch_time?(start_time)
      return if @doctor.start_lunch_break.nil? || @doctor.end_lunch_break.nil?
      return if @doctor.start_lunch_break >= @doctor.end_lunch_break

      start_time >= @doctor.start_lunch_break && start_time < @doctor.end_lunch_break
    end

    def its_day_off?(start_date_time)
      @doctor.send(WDAY_DB[start_date_time.wday])
    end

    def already_is_appointment?(start_date_time)
      @doctor.appointments.where(start_time: start_date_time).present?
    end
  end
end
