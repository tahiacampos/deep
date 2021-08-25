Rails.application.routes.draw do
  get 'flats/index'
  # get 'services/index'
  # # get 'services/show'
  ##get 'services/edit'
  # get 'services/new'
  get '/search', to: 'flats#search'
  # devise_for :users
  # root to: 'pages#home'
  # resources :pages do
  #   resources :services
  # end
  # resources :home, only: [:home, :index] 
  # resources :categories, only: [:home, :index, :show]
  # resources :services
  resources :flats
  resources :services do
    collection do
      get 'servicios'
      get 'limpieza'
      get 'sanitizacion'
      get 'mantencion'
      
    end
  end
  
  resources :pages, except: [:destroy, :edit, :new, :create, :update]
  resources :categories
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/services',    to: 'pages#services
  
end
