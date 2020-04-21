class Contact < ApplicationRecord
  belongs_to :animal
  belongs_to :user
  validates_uniqueness_of :facility_id,scope: :user_id
end
