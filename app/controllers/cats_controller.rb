class CatsController < ApplicationController
  def index
    @cat = Animal.where(species:1).order('id DESC')
  end
end
