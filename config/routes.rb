Rails.application.routes.draw do
  namespace :authentication, path: '', as: '' do
    resources :users, only: [:new, :create], path: '/register', path_name: { new: '/' }
    resources :sessions, only: [:new, :create, :destroy], path: '/login', path_name: { new: '/' }
  end

  resources :categories, except: :show
  # delete '/products/:id', to: 'products#destroy'
  # patch '/products/:id', to: 'products#update'
  # post '/products', to: 'products#create'
  # get '/products/new', to: 'products#new', as: :new_product
  # get '/products/:id', to: 'products#show', as: :product
  # get '/products', to: 'products#index'
  # get '/products/:id/edit', to: 'products#edit', as: :edit_product
  resources :products, path: '/'

end
