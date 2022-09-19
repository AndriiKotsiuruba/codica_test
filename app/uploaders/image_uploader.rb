# frozen_string_literal: true

class ImageUploader < Shrine
  plugin :remove_invalid
  plugin :validation
  plugin :validation_helpers

  Attacher.validate do
    validate_max_size 1.megabytes
    validate_mime_type %w[image/jpeg image/png]
  end
end
