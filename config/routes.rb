Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
post '/products', to: 'products#create'
get '/products/new', to: 'products#new', as: :new_product
get '/products/:id', to: 'products#show', as: :product
get '/products', to: 'products#index'
end
