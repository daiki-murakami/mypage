Rails.application.routes.draw do
  get 'pages/index'
  get 'pages/new'
  get '/create', to: 'pages#new'
  post '/create',  to: 'pages#create'
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/profile'

  resources :pages
end
