# frozen_string_literal: true

module ReformErrors
  def self.to_human_readable(errors)
    str_errors = errors.messages.map { |k, v| "#{k.to_s.capitalize.gsub("_", " ")}(#{v.join(", ")})" }.join(", ")
    "Errors: #{str_errors}"
  end
end
