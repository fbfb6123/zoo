class FacilitiesController < ApplicationController

  def index
  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facility_params)
    if @facility.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @facility = Facility.find(params[:id])
    @animal = Animal.where(facility_id:params[:id]).paginate(page: params[:page], per_page: 8)
    @like = Like.new
  end

  private

  def facility_params
    params.require(:facility).permit(:name, :prefecture_id)
  end
end
