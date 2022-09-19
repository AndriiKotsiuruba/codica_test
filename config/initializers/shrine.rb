# frozen_string_literal: true

require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"
require "shrine/plugins/url_options"

s3_options = {
  bucket: Rails.application.credentials.dig(:aws, :bucket),
  region: Rails.application.credentials.dig(:aws, :region),
  access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
  secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key)
}
Shrine.storages = if Rails.application.config.shrine_storage_s3
                    {
                      cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
                      store: Shrine::Storage::S3.new(**s3_options)
                    }
                  else
                    {
                      cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
                      store: Shrine::Storage::FileSystem.new("public", prefix: "uploads") # permanent
                    }
                  end
Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data
Shrine.plugin :derivatives
