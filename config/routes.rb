Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'
  post 'users/login', to: 'users#login'
  post 'users/create', to: 'users#create'
  get 'users/logout', to: 'users#logout'
  resource :users
  get 'products', to: 'products#index'
  get 'cart', to: 'carts#index'
  get 'add_to_cart/:product_id', to: 'carts#add_product'
  get 'remove_product/:product_id', to: 'carts#remove_product'
  get 'update_quantity/:product_id/:quantity/:type', to: 'carts#update_quantity'
end
