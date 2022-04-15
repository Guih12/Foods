Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products
  resources :users
  resources :combos
  resources :restaurants

  namespace :consumers do
    resources :restaurants
    resources :place_orders
  end
end
