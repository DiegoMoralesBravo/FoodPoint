Rails.application.routes.draw do
  get 'orders/index'

  root 'home#index'

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :items
  resources :kitchen
  resources :reports
  resources :tables
  resources :orders
  resources :close_and_open
end
