# frozen_string_literal: true

class UserSettingsController < DeviseSettingsController
  before_action :authenticate_user!

  private

  def resource
    @resource ||= current_user
  end

  def resource_edit_path
    user_settings_path
  end

  def require_params
    params.require(:user).permit(:phone_number, :verification_code,
                                 :current_password, :password,
                                 :password_confirmation, :destroy_confirmation)
  end
end
