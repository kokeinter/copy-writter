class Recruit < ApplicationRecord
  has_many :applies, dependent: :destroy
  belongs_to :company

  mount_uploader :image, ImageUploader
end
