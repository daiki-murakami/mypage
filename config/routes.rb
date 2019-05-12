Rails.application.routes.draw do
  get 'pages/new'
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'

  resources :pages
  get '/create', to: 'pages#new'
  post '/create',  to: 'pages#create'
end
