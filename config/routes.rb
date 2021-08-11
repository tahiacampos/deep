Rails.application.routes.draw do
  get 'services/index'
  get 'services/show'
  get 'services/edit'
  get 'services/new'
  devise_for :users
  root to: 'pages#home'
  resources :services
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/services',    to: 'pages#services'
end
