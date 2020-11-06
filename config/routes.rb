Rails.application.routes.draw do
  resources :event do
    resources :charges
    resources :attendances
    resources :avatars, only: [:create]
  end

  namespace :admin do
    root "admin#index"
    resources :event, :users
  end
  devise_for :users

  root "event#index"
  resources :users, only: [:show] do
    resources :pictures, only: [:create]
  end
end
