Rails.application.routes.draw do
  get 'items_planner/index'
  get 'orders/index'

  root 'home#index'

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :items
  resources :kitchen do
    patch :update_status, on: :member
    patch :update_status_item, on: :member
    patch :whoops, on: :member
  end
  resources :reports
  resources :tables
  resources :close_and_open do
    patch :update_status, on: :member
  end
  resources :orders
  resources :items_planner

end
