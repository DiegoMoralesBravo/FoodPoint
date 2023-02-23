Rails.application.routes.draw do
  get 'orders/index'

  devise_for :users

  root 'home#index'

  resources :items
  resources :kitchen
  resources :reports
  resources :tables
  resources :orders
end
