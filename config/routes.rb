Rails.application.routes.draw do
  resources :languages, only: [:index]
  resources :messages, except: [:new, :edit, :update]
  resources :chats, except: [:edit, :update]
  resources :users

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
