Rails.application.routes.draw do


  root 'home#index'

  # devise_for :users
  resources :items
  resources :kitchen
  resources :reports
  resources :tables
end
