class MenusController < ApplicationController
  def index
    @q = Menu.ransack(params[:q]) #ransackで検索された献立を表示する
    @menus = @q.result(distinct: true)
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def new
    @menu = Menu.new
    @menu_products = MenuProduct.where("menu_id is null")
  end

  def create
    menu = Menu.new(menu_params)
    menu.user_id = current_user.id
    if menu.save
      # menu_idの存在しないMenuProductのmenu_idを更新する
      MenuProduct.where("menu_id is null").update(menu_id: menu.id)
      redirect_to menus_path
    else
      redirect_to products_path
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to menus_path
  end

  private

  def menu_params
    params.require(:menu).permit(:title, :description)
  end

end
