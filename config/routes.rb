Rails.application.routes.draw do
  resources :messages
  resources :conversations
  mount ActionCable.server => '/cable'
  post 'auth/login'
  post 'auth/sign_up'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
