class DogsController < ApplicationController
  def index
    @dog = Animal.where(species:0).paginate(page: params[:page], per_page: 8)
  end
end
