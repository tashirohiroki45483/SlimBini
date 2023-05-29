class HomesController < ApplicationController

  def top
    @menus = Menu.order(created_at: :desc).limit(3) #Menuの新着３件を取得する
  end

end
