class AnimalsController < ApplicationController
  def index
    @animal = Animal.new
    @animals = Animal.find(params[:id])
    @animalss = Animal.all
  end

  def show
    @animal = Animal.new
    @animals = Animal.find(params[:id])
    @dog = Animal.where(species:0).paginate(page: params[:page], per_page: 8)
  end

  def new
    @facility = Facility.find(params[:facility_id])
    @animal = Animal.new
  end

  def create
    @facility = Facility.find(params[:facility_id])
    @animal = @facility.animals.new(animal_params)
    
    if @animal.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name,:species, :type,:gender,:age,:image1,:image2,:image3)
  end
end
