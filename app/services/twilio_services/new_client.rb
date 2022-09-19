# frozen_string_literal: true

module TwilioServices
  class NewClient < ApplicationService
    def call
      Twilio::REST::Client.new(Rails.application.credentials.dig(:twilio, :account_sid),
                               Rails.application.credentials.dig(:twilio, :auth_token))
    end
  end
end
