# frozen_string_literal: true

Devise.setup do |config|
  require "devise/orm/active_record"
  config.authentication_keys = [:phone_number]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete
end
