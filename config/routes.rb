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
  get 'searched_books', to: 'books#searchedIndex', as: :searched
  get '/books/thank', to: 'books#thank'
  get '/books/:id' => 'books#show', as: :book
  get '/books/lend/:id' => 'books#lend', as: :lend
  get '/books/returnBook/:id' => 'books#returnBook', as: :returnBook
  get '/users/lendedBooks' => 'users#lendedBooks'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
