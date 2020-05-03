Rails.application.routes.draw do
  get 'home/index'

  resources :accounts
  resources :entries

  root 'home#index'
end
