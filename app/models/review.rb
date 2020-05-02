class Review < ApplicationRecord
  belongs_to :user
  belongs_to :animal

  validates :name, presence: true
  validates :text, presence: true
  # validates :content, presence: true, unless: :image?
  validates :image,presence: { message: 'を選択してください' }
  mount_uploader :image, ImageUploader

end
