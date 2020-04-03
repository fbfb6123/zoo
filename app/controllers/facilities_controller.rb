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
      render :index
    end
  end

  private

  def facility_params
    params.require(:facility).permit(:name, :prefecture_id)
  end
end
