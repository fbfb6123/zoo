class Review < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
end
