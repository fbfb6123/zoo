class UsersController < ApplicationController
  require 'will_paginate/array'
  before_action :set_current_user

  def index
    @facilities = Like.where(user_id: current_user.id).pluck(:facility_id)
    @facility = Facility.find(@facilities)
    @favorites = Favorite.where(user_id: current_user.id).pluck(:animal_id)
    @favorite = Animal.find(@favorites).paginate(page: params[:page], per_page: 4)
  end

  def show
  end


  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:phone_number,:city, :city_adress,:name_kana,:encrypted_password,:birthday,:icon,:introduction)
  end

end
