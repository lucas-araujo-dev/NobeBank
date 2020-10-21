Rails.application.routes.draw do
  get "home/index"
  resources :deposits, only: [:new, :create]
  resources :withdrawals, only: [:new, :create]
  resources :transferences, only: [:new, :create]

  root to: "home#index"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
