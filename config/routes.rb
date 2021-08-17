Rails.application.routes.draw do
  get 'flats/index'
  get 'services/index'
  # get 'services/show'
  # get 'services/edit'
  get 'services/new'
  get '/search', to: 'flats#search'
  devise_for :users
  root to: 'pages#home'
  resources :home, only: :home
  resources :categories, only: [:home, :index, :show]
  resources :services
  resources :flats
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/services',    to: 'pages#services
end
