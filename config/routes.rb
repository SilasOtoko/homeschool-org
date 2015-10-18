Rails.application.routes.draw do
  root 'pages#welcome'
  
  get '/log_in', to: 'sessions#new'
  get '/register', to: 'users#new'
  get '/log_out', to: 'sessions#destroy'
  post '/log_in', to: 'sessions#create'
  get '/dashboard', to: 'pages#dashboard'
  get '/calendar', to: 'pages#calendar'

  resources :homeschools, only: [:show, :edit, :update]
  resources :users, only: [:edit, :create, :show]
  resources :students do
    resources :assignments
  end
end
