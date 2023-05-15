class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @menu = Menu.find(params[:menu_id])
    bookmark = current_user.bookmarks.build(menu_id: params[:menu_id])
    bookmark.save
  end

  def destroy
    @menu = Menu.find(params[:menu_id])
    bookmark = Bookmark.find_by(user_id: current_user.id, menu_id: params[:menu_id])
    bookmark.destroy
  end

end
