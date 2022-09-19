# frozen_string_literal: true

class DeviseSettingsController < ApplicationController
  helper_method :resource
  helper_method :resource_edit_path

  def edit; end

  def update
    if verification_code_correct?
      flash.now[:notice] = t("resources.notices.resource-updated") if resource_update
    else
      @verificate = true
      resource.errors.add(:verification_code, :invalid)
    end
    render :edit
  end

  def destroy
    if require_params[:destroy_confirmation].to_i.positive?
      resource.destroy
      redirect_to root_path, notice: t("resource.notices.destroyed")
    else
      flash.now[:alert] = t("resource.notices.no_confirm_destroy")
      render :edit
    end
  end

  private

  def verification_code_correct?
    return true unless require_params[:verification_code]

    TwilioServices::CheckVerification.call(require_params[:phone_number], require_params[:verification_code])
  end

  def resource_update
    require_params[:current_password] ? resource.update_with_password(require_params) : resource.update(require_params)
  end
end
