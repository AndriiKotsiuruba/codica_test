# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    association :doctor
    association :user

    start_time { FFaker::Time.between(Time.zone.now, 14.days.after) }
    end_time { start_time + (60 * 60) }

    full_name { FFaker::Name.name }
    symptoms { FFaker::Book.description }

    factory :doctor_with_recommendation do
      recommendation do
        association(:recommendation, appointment: instance)
      end
    end
  end
end
