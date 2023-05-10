class MenusController < ApplicationController

  def index
    @menus = current_user.menus.all
  end

  def show
    @menu = current_user.menus.find(params[:id])
  end

  def new
    @menu = Menu.new
  end

end
