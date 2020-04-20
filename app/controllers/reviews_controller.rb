class ReviewsController < ApplicationController
  before_action :set_review

  def index
  end

  def show
    @reviews = Review.all
    @animals = Animal.find(params[:id])
    @animal = Animal.limit(4).order('id DESC')
  end

  def new

  end



  def create

    if @review.save
      redirect_to reviews_path, notice: 'メッセージが送信されました'
    else
      render :index
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
