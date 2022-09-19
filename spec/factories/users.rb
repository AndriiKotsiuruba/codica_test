# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    phone_number { "+#{FFaker::Random.rand((10**6)..((10**15) - 1))}" }
    sequence(:password) { |n| "PassWord#{n}" }

    factory :user_with_appointments do
      transient do
        appointments_count { FFaker::Random.rand(1..4) }
      end
      appointments do
        Array.new(appointments_count) { association(:appointment, user: instance) }
      end
    end

    factory :admin_user, class: "AdminUser"
  end
end
