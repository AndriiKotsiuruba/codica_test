# frozen_string_literal: true

class User < ApplicationRecord
  attribute :verification_code, :string
  attribute :destroy_confirmation, :boolean

  has_many :appointments, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :phone_number, uniqueness: true,
                           format: { with: /\A\+[0-9]{7,15}\z/,
                                     message: I18n.t("errors.messages.invalide_phone_number") }

  def email_required?; end

  def will_save_change_to_email?; end
end
