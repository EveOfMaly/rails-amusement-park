Rails.application.routes.draw do

  root "users#new"
  resources :users, only: [:new, :show, :create ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
end
