# frozen_string_literal: true

module TwilioServices
  class CheckVerification < ApplicationService
    SUCCESSFUL_STATUS = "approved"
    def initialize(phone, code)
      @phone = phone
      @code = code
      @client = TwilioServices::NewClient.call
    end

    def call
      verification_check = @client.verify.services(Rails.application.credentials.dig(:twilio, :service_sid))
                                  .verification_checks
                                  .create(to: @phone, code: @code)
      verification_check.status == SUCCESSFUL_STATUS
    rescue StandardError
      false
    end
  end
end
