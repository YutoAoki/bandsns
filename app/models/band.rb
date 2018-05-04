class Band < ApplicationRecord
  belongs_to :user
  # mount_uploader :image, ImageUploader
  mount_uploader :band_img, ImageUploader
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'


  validates :band_name, presence: true
  validates :band_img, presence: true
  validates :band_bio, presence: true

end
