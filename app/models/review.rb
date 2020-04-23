class Review < ApplicationRecord
  belongs_to :user
  belongs_to :animal

  validates :content, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
end
