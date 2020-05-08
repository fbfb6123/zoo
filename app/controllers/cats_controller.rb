class CatsController < ApplicationController
  def index
    @cat = Animal.where(species:1, buyer_id: nil).paginate(page: params[:page], per_page: 8)
  end
end
