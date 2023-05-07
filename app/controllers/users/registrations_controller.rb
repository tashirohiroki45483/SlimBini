# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create] #サインアップ時にnameカラムを追加する
  before_action :configure_account_update_params, only: [:update] #editパラメーター
  before_action :ensure_guest_user, only: [:edit] #ゲストログイン制限 編集画面に行けない

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  #サインアップ時にnameカラムを追加する
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  #editパラメーター
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image , :goal_calorie])
  end
  
  #ゲストログイン制限 編集画面に行けない
  def ensure_guest_user
    @user = current_user
    if @user.name == "guestuser"
      flash[:notice] = 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
      redirect_to user_path(current_user)
    end
  end  
  
  def after_update_path_for(resource) #会員情報編集後マイページに遷移
    user_path(resource)
  end
  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
