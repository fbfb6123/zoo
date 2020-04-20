class Favorite < ApplicationRecord
  belongs_to :animal
  belongs_to :user
  validates_uniqueness_of :animal_id,scope: :user_id
end
