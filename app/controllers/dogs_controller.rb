class DogsController < ApplicationController
  def index
    @dog = Animal.where(species:0).order('id DESC')
  end
end
