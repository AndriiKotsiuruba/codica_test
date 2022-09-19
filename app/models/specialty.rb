# frozen_string_literal: true

class Specialty < ApplicationRecord
  has_many :doctors, dependent: :nullify

  validates :name, uniqueness: true
end
