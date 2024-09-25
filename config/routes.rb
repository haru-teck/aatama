Rails.application.routes.draw do
  root 'users#show'

  resources :conditions
  resources :users
end
