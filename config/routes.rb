Rails.application.routes.draw do
  root 'users#show'

  resources :conditions, only: [:new, :create]
  resources :users, only: [:edit, :update, :destroy]
end
