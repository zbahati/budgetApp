# config/initializers/shrine.rb
require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/memory"

if Rails.env.test?
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # use file system storage for cache
    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads")       # use file system storage for store
  }
else
  Shrine.storages = {
    cache: Shrine::Storage::Memory.new, # temporary
    store: Shrine::Storage::Memory.new  # permanent
  }
end

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
Shrine.plugin :validation
Shrine.plugin :validation_helpers
