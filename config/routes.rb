Rails.application.routes.draw do
  resources :languages, only: [:index]
  resources :messages, except: [:new, :edit, :update]
  resources :chats, except: [:edit, :update]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
