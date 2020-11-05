Rails.application.routes.draw do
  resources :event do
    resources :charges
    resources :attendances
    resources :avatars, only: [:create]
  end
  devise_for :users

  root "event#index"
  resources :users, only: [:show] do
    resources :pictures, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
