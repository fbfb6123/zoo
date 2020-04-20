class Like < ApplicationRecord
  belongs_to :facility
  belongs_to :user
  validates_uniqueness_of :facility_id,scope: :user_id
end
