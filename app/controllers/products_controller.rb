class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def create
  	@product = Product.new(params.require(:product).permit(:name, :description, :price_in_cents))

  	if @product.save
  		redirect_to product_path(@product)
  	else
  		render :edit
  	end
  end

  def update
  	@product = Product.find(params[:id])

  	if @product.update_attributes(:product)
  		redirect_to product_path(@product)
  	else
  		render :edit
  	end
  end

  def destroy
  	@product_path = Product.find(params[:id])
  	@product.destroy
  end
end
