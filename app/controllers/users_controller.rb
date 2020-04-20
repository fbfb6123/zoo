class UsersController < ApplicationController
  
  before_action :set_current_user

  def index
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
    params.require(:user).permit(:name,:phone_number,:city, :city_adress,:name_kana,:encrypted_password,:birthday,:icon,:introduction)
  end

end
