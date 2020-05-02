class Contact < ApplicationRecord
  belongs_to :animal
  validates :name, presence: true
  validates :email, presence: true
  validates :content, presence: true
end
