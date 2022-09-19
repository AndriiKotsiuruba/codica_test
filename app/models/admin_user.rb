# frozen_string_literal: true

class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validates :phone_number, uniqueness: true,
                           format: { with: /\A\+[0-9]{7,15}\z/,
                                     message: I18n.t("errors.messages.invalide_phone_number") }
  def email_required?; end

  def will_save_change_to_email?; end
end
