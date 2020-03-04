Rails.application.routes.draw do
  resources :languages, only: [:index]
  resources :messages, except: [:new, :edit, :update]
  resources :chats
  resources :users

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get 'chats/:id/add_user/user_id', to: 'chats#add_user', as: 'add_user'
  get 'chats/:id/remove_user/:user_id', to: 'chats#remove_user', as: 'remove_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
