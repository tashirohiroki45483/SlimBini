class UsersController < ApplicationController
   before_action :ensure_guest_user, only: [:edit]
   
  def show
    @user = current_user
  end
  
end
