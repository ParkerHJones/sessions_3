class ReviewsController < ApplicationController
  def index
    @reviews = Review.allrender component: 'Review', props:{ reviews: @reviews }
  end

  def show
    @review = Review.find(params[:id])
    render component: 'Review', props: { review: @review }
  end

  def new
    @review = Review.new
    render component: 'New', props: { review: @review }
  end

  def edit
    @review = Review.find(params[:id])
    render component: 'Review Edit', props: { review: @review }
  end

  def create
    @review = Review.new(review_params)
    if @review.save
    else 
      render component: 'ReviewNew', props: { review: @review }
    end
  end 

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
    else 
      render component: 'ReviewEdit', props: { review: @review }
    end 
  end 

  def destroy 
    @review = Review.find(params[:id])
    @review.destroy
    or 
    Review.find(params[:id]).destroy
  end 

  private 
  def review_params 
    params.require(:review).permit(:title, :description, :score)
  end 

end
