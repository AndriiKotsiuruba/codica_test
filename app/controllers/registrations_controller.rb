# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)
    return super unless resource.valid?

    code_correct = TwilioServices::CheckVerification.call(sign_up_params[:phone_number],
                                                          sign_up_params[:verification_code])
    return super if code_correct

    resource.errors.add(:verification_code, :invalid)
    render "devise/registrations/new", locals: { resource: resource, resource_name: resource_name }
  end

  private

  def sign_up_params
    params.require(:user).permit(:phone_number, :verification_code, :password, :password_confirmation)
  end
end
