class DogsController < ApplicationController
  def index
    @dog = Animal.where(species:0, buyer_id: nil).paginate(page: params[:page], per_page: 8)
  end
end
