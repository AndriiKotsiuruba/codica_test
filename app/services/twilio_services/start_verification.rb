# frozen_string_literal: true

module TwilioServices
  class StartVerification < ApplicationService
    def initialize(phone, channel = :sms)
      @phone = phone
      @channel = channel.to_s
      @client = TwilioServices::NewClient.call
    end

    def call
      channel = :sms unless %i[sms voice].include? @channel
      begin
        verification = @client.verify.services(Rails.application.credentials.dig(:twilio, :service_sid))
                              .verifications
                              .create(to: @phone, channel: channel)
        verification.sid
      rescue StandardError
        false
      end
    end
  end
end
