class Odai < ApplicationRecord
  has_many :copies, dependent: :destroy
  belongs_to :user

  mount_uploader :image, ImageUploader
end
