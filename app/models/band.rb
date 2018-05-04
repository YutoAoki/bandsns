class Band < ApplicationRecord
  belongs_to :user
  # mount_uploader :image, ImageUploader
  mount_uploader :band_img, ImageUploader

end
