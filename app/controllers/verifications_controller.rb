# frozen_string_literal: true

class VerificationsController < ApplicationController
  def create
    render :failure unless TwilioServices::StartVerification.call(params[:phone_number])
  end
end
