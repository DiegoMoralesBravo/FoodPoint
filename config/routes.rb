Rails.application.routes.draw do
  get 'kitchen/index'
  get 'kitchen/new'
  get 'kitchen/create'
  get 'kitchen/show'
  get 'kitchen/update'
  get 'kitchen/destroy'
  get 'kitchen/edit'
  get 'reports/index'
  get 'reports/new'
  get 'reports/create'
  get 'reports/show'
  get 'reports/update'
  get 'reports/destroy'
  get 'reports/edit'
  get 'home/index'
  get 'items/index'
  get 'items/new'
  get 'items/create'
  get 'items/show'
  get 'items/update'
  get 'items/destroy'
  get 'items/edit'
  get 'tables/index'
  get 'tables/new'
  get 'tables/create'
  get 'tables/show'
  get 'tables/update'
  get 'tables/destroy'
  get 'tables/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
