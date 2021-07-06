# frozen_string_literal: true

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "#{Rails.env}/uploads/user/avatar/#{model.id}"
  end

  def default_url(*_args)
    "https://avatars.dicebear.com/api/jdenticon/#{model.first_name + model.last_name}.svg?w=200&h=200"
  end

  # process resize_to_fill: [200, 200]
  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end
end
