class HomesController < ApplicationController

  def top
    @menus = Menu.order(created_at: :desc).limit(3)
  end

end
