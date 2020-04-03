class Animal < ApplicationRecord
  self.inheritance_column = :_type_disabled 
  
  belongs_to :user, optional: true
  belongs_to :facility
end
