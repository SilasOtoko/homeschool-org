Rails.application.routes.draw do
  root 'pages#login'
  
  get '/log_in', to: 'sessions#new'
  get '/register', to: 'users#new'
  get '/log_out', to: 'sessions#destroy'
  post '/log_in', to: 'sessions#create'
  get '/dashboard', to: 'pages#dashboard'

  resources :homeschools, only: [:show]
  resources :users, only: [:edit, :create, :show]
end
