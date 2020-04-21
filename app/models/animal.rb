class Animal < ApplicationRecord
  self.inheritance_column = :_type_disabled 
  
  belongs_to :user, optional: true
  belongs_to :facility

  has_many :favorites
  has_many :favorited_users, through: :favorites, source: :user
end
