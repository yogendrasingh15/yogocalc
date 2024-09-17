Rails.application.routes.draw do
  resources :contacts
  resources :bets
  resources :roles
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
