class TopsController < ApplicationController
  def index
    @animal = Animal.limit(4).order('id DESC')
    @dog = Animal.where(species: 0).limit(4).order('id ASC')
    @cat = Animal.where(species: 1).limit(4).order('id ASC')
  end
end
