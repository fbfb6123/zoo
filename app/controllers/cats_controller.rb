class CatsController < ApplicationController
  def index
    @cat = Animal.where(species:1).paginate(page: params[:page], per_page: 8)
  end
end
