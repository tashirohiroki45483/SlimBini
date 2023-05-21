class MenuProductsController < ApplicationController
  before_action :authenticate_user! #ログインしていない場合はログインページに遷移させる

  def create
    @menu_product = MenuProduct.new(menu_product_params)
    @menu_product.user = current_user
    if @menu_product.save
      redirect_to new_menu_path
    else
      redirect_to products_path
    end
  end

  def destroy
  @menu_product = MenuProduct.find(params[:id])
  @menu_product.destroy
  redirect_to new_menu_path
  end

  private

  def menu_product_params
    params.require(:menu_product).permit(:user_id, :product_id, :meal_type)
  end

end
