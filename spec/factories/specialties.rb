# frozen_string_literal: true

FactoryBot.define do
  factory :specialty do
    sequence(:name) { |n| "#{FFaker::Skill.specialty}#{n}" }
  end
end
