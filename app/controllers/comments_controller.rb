class CommentsController < ApplicationController

  def create
    @menu = Menu.find(params[:menu_id])
    @comment = @menu.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      
    else
      # error handling
    end
  end

  def destroy
    @menu = Menu.find(params[:menu_id])
    @comment = @menu.comments.find(params[:id])
    @comment.destroy
    
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
