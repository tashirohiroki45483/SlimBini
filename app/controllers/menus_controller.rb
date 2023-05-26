class MenusController < ApplicationController
  before_action :authenticate_user! #ログインしていない場合はログインページに遷移させる
  before_action :ensure_guest_user, only: [:destroy] #ゲストログイン制限 削除機能制限

  def index
    @q = Menu.ransack(params[:q]) #ransackで検索された献立を表示する
    @menus = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(9) #orderで新しく作成したものを上に表示させる #ページネーション
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def new
    @menu = Menu.new
    @menu_products = current_user.menu_products.where("menu_id is null")
  end

  def create
    @menu = current_user.menus.new(menu_params)
    @menu_products = current_user.menu_products.where("menu_id is null")
    # menup_productsが存在しない場合、新規献立作成にリダイレクトさせる
    if @menu_products.empty?
      flash[:notice] = '献立を投稿する前に商品を追加してください。'
      redirect_to new_menu_path
      return #メソッドの実行を終了させる
    end
    if @menu.save
      # menu_idがnullの全てのMenuProductsのmenu_idを更新します
      @menu_products.update_all(menu_id: @menu.id)
      flash[:notice] = '献立が投稿されました。'
      redirect_to menu_path(@menu)
    else
      render :new
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

  #ゲストログイン制限
  def ensure_guest_user
    @user = current_user
    if @user.name == "guestuser"
      flash[:notice] = 'ゲストユーザーは献立を削除できません。'
      redirect_to request.referer
    end
  end

end
