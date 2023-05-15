class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    bookmark = current_user.bookmarks.build(menu_id: params[:menu_id])
    bookmark.save
    redirect_to request.referer
  end

  def destroy
    bookmark = Bookmark.find_by(user_id: current_user.id, menu_id: params[:menu_id])
    bookmark.destroy
    redirect_to request.referer
  end

end
