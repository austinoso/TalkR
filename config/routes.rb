Rails.application.routes.draw do
  resources :languages, only: [:index]
  resources :messages, except: [:new, :edit, :update]
  resources :chats
  resources :users, except: [:new]
  resources :contacts, only: [:index, :show, :destroy]

  get '/login', to: 'sessions#new', as: 'login'
  get '/register', to: 'users#new', as: 'register'
  get "/" => redirect("/chats")
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get 'chats/:id/add_user/user_id', to: 'chats#add_user', as: 'add_user'
  get 'chats/:id/remove_user/:user_id', to: 'chats#remove_user', as: 'remove_user'

  post '/users/:id/add_contact', to: 'users#add_contact', as: 'add_contact'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end