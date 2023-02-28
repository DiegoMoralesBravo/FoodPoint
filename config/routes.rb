Rails.application.routes.draw do
  get 'orders/index'

  root 'home#index'

  devise_for :users
  resources :items
  resources :kitchen
  resources :reports
  resources :tables
  resources :orders
  resources :close_and_open
end
