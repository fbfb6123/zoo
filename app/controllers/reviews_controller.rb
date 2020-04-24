class ReviewsController < ApplicationController
  before_action :set_review

  def index
    @animal = Animal.where(buyer_id: current_user.id).limit(4).order('id ASC')
    @animals = Animal.all
  end

  def show
    @animal = Animal.limit(4).order('id DESC')
    @animals = Review.find(params[:id])
  end

  def new
    @animal = Animal.find(params[:animal_id])
    @review = Review.new
  end



  def create
    @animal = Animal.find(params[:animal_id])
    @review = @animal.reviews.new(review_params)
    
    if @review.save
      redirect_to root_path, notice: 'メッセージが送信されました'
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :text, :image).merge(user_id: current_user.id)
  end

  def set_review
    @review = Review.new
  end

end
