Rails.application.routes.draw do
  
  root 'homes#top'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  resources :users do
    member do
      get 'set_goal_calorie'
      patch 'update_goal_calorie'
    end
  end
  
  resources :products
  resources :menus
  resources :daily_menus
end

