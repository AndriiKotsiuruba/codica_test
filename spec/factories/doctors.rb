# frozen_string_literal: true

FactoryBot.define do
  factory :doctor do
    association :specialty

    phone_number { "+#{FFaker::Random.rand((10**6)..((10**15) - 1))}" }
    sequence(:password) { |n| "PassWord#{n}" }

    full_name { FFaker::Name.name }
    experience_at { FFaker::Time.between(25.years.ago, Time.zone.now) }
    description { FFaker::Book.description }

    factory :doctor_with_appointments do
      transient do
        appointments_count { FFaker::Random.rand(1..4) }
      end
      appointments do
        Array.new(appointments_count) { association(:appointment, doctor: instance) }
      end
    end
  end
end
