Rails.application.routes.draw do

  root 'homes#top'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do #ゲストログイン
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :users do
    member do
      get 'set_goal_calorie'
      patch 'update_goal_calorie'
    end
  end

  resources :products

  resources :menus do
    resource :bookmarks, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end

  resources :menu_products

end

