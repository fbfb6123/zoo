class TopsController < ApplicationController
  def index
    @animal = Animal.where(buyer_id: nil).limit(4).order('id DESC')
    @event = Event.limit(3).order('id DESC')
    @dog = Animal.where(species: 0,buyer_id: nil).limit(4).order('id ASC')
    @cat = Animal.where(species: 1,buyer_id: nil).limit(4).order('id ASC')
    @review = Review.limit(3).order('id DESC')
    
  end
end
