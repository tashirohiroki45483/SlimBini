class UsersController < ApplicationController
  before_action :authenticate_user! #ログインしていない場合はログインページに遷移させる
  before_action :ensure_guest_user, only: [:set_goal_calorie] # ゲストユーザーは遷移できない

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

  def update_goal_calorie
    if params[:weight].blank? || params[:height].blank? || params[:age].blank? #どれか１つでも空の場合はtureになり、returnが行われる
      return redirect_to set_goal_calorie_user_path, notice: '体重、身長、年齢を入力してください。'
    end
    weight = params[:weight].to_f # 入力された体重を数値型に変換(浮動小数点数)
    height = params[:height].to_f # 入力された体重を数値型に変換(浮動小数点数)
    age = params[:age].to_i # 入力された年齢を数値型に変換(整数)
    gender = params[:gender] # 入力された性別を取得
    activity_level = params[:activity_level].to_f # 入力された活動レベルを数値型に変換(浮動小数点数)
    if gender == 'male' # 性別が男性の場合、以下の式で基礎代謝量を計算
      bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5
    else                # 性別が女性の場合、以下の式で基礎代謝量を計算
      bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161
    end
    tdee = bmr * activity_level # 総エネルギー消費量を計算
    goal_calorie = tdee - 240 # 月に1kg減量を目指すと仮定し、目標摂取カロリーを計算
    current_user.update(goal_calorie: goal_calorie)
    redirect_to user_path, notice: '目標摂取カロリーが更新されました！'
  end

  protected

  #ゲストログイン制限 目標摂取カロリー設定画面に行けない
  def ensure_guest_user
    @user = current_user
    if @user.name == "guestuser"
      flash[:notice] = 'ゲストユーザーは目標摂取カロリー設定画面へ遷移できません。'
      redirect_to user_path(current_user)
    end
  end

end
