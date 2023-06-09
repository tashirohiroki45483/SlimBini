class ProductsController < ApplicationController
  before_action :authenticate_user! #ログインしていない場合はログインページに遷移させる
  before_action :ensure_guest_user, only: [:destroy, :edit] #ゲストログイン制限 削除・編集機能制限

  def index
    @q = Product.ransack(params[:q]) #ransackで検索された商品を表示
    @products = @q.result(distinct: true).page(params[:page]).per(10) #ページネーション
    @menu_product = MenuProduct.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(product_params) #current_userに紐づく新しいProductが作成
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

  def destroy
    @product = Product.find(params[:id])
    if @product.user == current_user # 現在ログインしているユーザーが商品を投稿したユーザーと同じであることを確認
      @product.destroy
      flash[:notice] = '商品を削除しました'
      redirect_to products_path
    else
      flash[:alert] = '商品を削除できませんでした'
      redirect_to products_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :user_id, :genre_id, :name, :description, :calories, :protein, :fat, :carbohydrate)
  end

    #ゲストログイン制限
  def ensure_guest_user
    @user = current_user
    if @user.name == "guestuser"
      flash[:notice] = 'ゲストユーザーは商品削除・編集は利用できません。'
      redirect_to products_path
    end
  end

end