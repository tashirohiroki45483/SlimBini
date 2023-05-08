class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(product_params) #current_userに紐づく新しいProductが作成される
    if @product.save
      redirect_to product_path(@product.id)
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to product_path(product.id)
  end

  private

  def product_params
    params.require(:product).permit(:image, :user_id, :genre_id, :name, :description, :calories, :protein, :fat, :carbohydrate)
  end

end
