class MenuCommentsController < ApplicationController

  def create
    @menu = Menu.find(params[:menu_id])
    @comment = @menu.menu_comments.create(menu_comment_params)
    @comment.user = current_user
    if @comment.save

    else
      # error handling
    end
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

end
