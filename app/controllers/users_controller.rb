class UsersController < ApplicationController
   before_action :ensure_guest_user, only: [:edit]

  def show
    @user = current_user
  end

  def likes
    @user = current_user
    @liked_menus = @user.liked_menus
  end

  def bookmarks
    @user = current_user
    @bookmarked_menus = @user.bookmarked_menus
  end

end
