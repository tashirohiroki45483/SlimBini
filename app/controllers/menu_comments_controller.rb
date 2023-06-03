class MenuCommentsController < ApplicationController
  before_action :authenticate_user! #ログインしていない場合はログインページに遷移させる
  before_action :ensure_guest_user, only: [:create, :destroy] #ゲストログイン制限 コメント機能制限

  def create
    @menu = Menu.find(params[:menu_id])
    @comment = @menu.menu_comments.create(menu_comment_params)
    @comment.score = Language.get_data(menu_comment_params[:comment])  #Google Natural Language API (自然言語処理)でscoreを自動生成
    @comment.user = current_user
    @comment.save
  end

  def destroy
    @menu = Menu.find(params[:menu_id])
    @comment = @menu.menu_comments.find(params[:id])
    @comment.destroy

  end

  private

  def menu_comment_params
    params.require(:menu_comment).permit(:comment)
  end

  #ゲストログイン制限
  def ensure_guest_user
    @user = current_user
    if @user.name == "guestuser"
      flash[:notice] = 'ゲストユーザーはコメント機能を利用できません。'
      redirect_to request.referer
    end
  end

end
