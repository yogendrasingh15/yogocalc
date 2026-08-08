Rails.application.routes.draw do
  resources :tickets
  resources :assets
  resources :nominees
  resources :contacts
  resources :bets
  resources :roles
  resources :sellers
  resources :profiles
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
