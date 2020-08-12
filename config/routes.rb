Rails.application.routes.draw do
  get 'home/index'

  resources :accounts
  resources :entries
  resources :users, except: [:new]

  root 'home#index'

  get 'signup', to: 'users#new'

  # Login
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
