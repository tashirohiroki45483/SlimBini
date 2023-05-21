class LikesController < ApplicationController
  before_action :authenticate_user! #ログインしていない場合はログインページに遷移させる

  def create
    @menu = Menu.find(params[:menu_id])
    like = current_user.likes.build(menu_id: params[:menu_id])
    like.save
  end

  def destroy
    @menu = Menu.find(params[:menu_id])
    like = Like.find_by(user_id: current_user.id, menu_id: params[:menu_id])
    like.destroy
  end

end
