class Api::ReviewsController < ApplicationController
  before_action :require_logged_in, only: [:create, :update, :destroy]

  def index
    # @reviews = Review.where("product_name = (?)", params[:product_name])
    @reviews = Product.joins(:reviews).where("name = (?)", capitalize_name(params[:product_name])).map { |product| product.reviews }.flatten
    render :index
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      render :show
    else 
      render json: { errors: @review.errors.full_messages }, status: 422
    end
  end

  def update
    @review = Review.find_by_id(params[:id])
    if @review&.update(review_params)
      render :show
    else  
      render json: { errors: @review.errors.full_messages }, status: 422
    end
  end

  def destroy
    @review = Review.find_by_id(params[:id])
    if @review.destroy
      render json: { message: 'Successfully deleted review' }
    end
  end

  private
  def review_params
    params.require(:review).permit(:id, :reviewer_name, :title, :body, :rating, :product_id, :reviewer_id)
  end
end
