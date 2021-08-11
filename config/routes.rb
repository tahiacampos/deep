Rails.application.routes.draw do
  get 'services/index'
  get 'services/show'
  get 'services/edit'
  get 'services/new'
  devise_for :users
  root to: 'pages#home'
  resources :home, only: :home
  resources :categories, only: [:home, :index, :show]
  resources :services
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
