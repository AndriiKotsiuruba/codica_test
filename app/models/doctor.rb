# frozen_string_literal: true

class Doctor < ApplicationRecord
  attribute :verification_code, :string
  attribute :destroy_confirmation, :boolean

  belongs_to :specialty, optional: true
  has_one :picture, as: :imageable, dependent: :destroy
  has_many :appointments, dependent: :nullify

  accepts_nested_attributes_for :picture

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :phone_number, uniqueness: true,
                           format: { with: /\A\+[0-9]{7,15}\z/,
                                     message: I18n.t("errors.messages.invalide_phone_number") }

  def email_required?; end

  def will_save_change_to_email?; end
end
