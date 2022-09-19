# frozen_string_literal: true

class Picture < ApplicationRecord
  include ImageUploader::Attachment(:image)
  NO_IMAGE = "/images/no_image_placeholder.png"

  belongs_to :imageable, polymorphic: true
end
