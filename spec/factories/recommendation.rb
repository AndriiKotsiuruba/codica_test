# frozen_string_literal: true

FactoryBot.define do
  factory :recommendation do
    association :appointment

    body { FFaker::Book.description }
    unreviewed { true }
  end
end
