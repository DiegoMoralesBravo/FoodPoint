Rails.application.routes.draw do

  root 'home#index'

  resources :items
  resources :kitchen
  resources :reports
  resources :tables
end
