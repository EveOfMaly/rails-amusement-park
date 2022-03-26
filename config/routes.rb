Rails.application.routes.draw do

  get "/", to: "static#home"
  root "static#home"
  resources :users, only: [:new, :show, :create ]
  resources :attractions
  resources :rides, only: [:index, :new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
end
