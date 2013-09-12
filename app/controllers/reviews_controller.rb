class ReviewsController < ApplicationController
  before_action :ensure_logged_in, only: [:edit, :create, :show, :update, :destroy]

  def show
  	@review = Review.find(params[:id])
  end

  def create
    @review = @product.reviews.build(params[:review])
  	@review.user.id = current_user.id

  	if review.save
  		redirect_to products_path, notice: "Thanks for leaving a review!"
  	else
  		render action: :show
  	end
  end

  def edit
  	@review = Review.find(params[:id])
  end
  # Refer back to the Photogur assignment when making the view. 

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  	redirect_to prodcuts_path
  end

  private

  def load_product
  @product = Product.find(params[:product_id])
  end
end
