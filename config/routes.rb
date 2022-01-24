Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'

  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  post 'logout', to: 'sessions#destroy'

  resources :users, only: [:show, :new, :create]
  resources :polls, except: [:destroy]
  resources :votes, only: [:create]
end
