Rails.application.routes.draw do
  get 'users/new'
  get 'pages/index'
  get 'pages/new'
  get '/create', to: 'pages#new'
  post '/create',  to: 'pages#create'
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/profile'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :pages
end
