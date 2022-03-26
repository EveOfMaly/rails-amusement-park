Rails.application.routes.draw do

  get 'attractions/new'
  root "users#new"
  resources :users, only: [:new, :show, :create ]
  resources :attractions, only: [:index, :new, :create, :show]
  resources :rides, only: [:index, :new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
end
