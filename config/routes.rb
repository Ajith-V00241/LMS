Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  root 'sessions#welcome'
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'logOut', to: 'sessions#destroy', as: :logout
  #get 'loggedOut', to: 'sessions#loggedOut' 
  get 'authorized', to: 'sessions#page_requires_login'

  get 'books', to: 'books#index'
  get '/books/thank', to: 'books#thank'
  get '/books/:id' => 'books#show', as: :book
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
