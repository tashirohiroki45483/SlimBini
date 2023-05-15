class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    like = current_user.likes.build(menu_id: params[:menu_id])
    like.save
    redirect_to request.referer
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, menu_id: params[:menu_id])
    like.destroy
    redirect_to request.referer
  end
  
end
