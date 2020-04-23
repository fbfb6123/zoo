class TopsController < ApplicationController
  def index
    @animal = Animal.limit(4).order('id DESC')
    @event = Event.limit(3).order('id DESC')
    @dog = Animal.where(species: 0).limit(4).order('id ASC')
    @cat = Animal.where(species: 1).limit(4).order('id ASC')
    @review = Review.limit(3).order('id DESC')
    
  end
end
