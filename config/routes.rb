Rails.application.routes.draw do
  devise_for :users

  # ログインしていないユーザーのルートパス
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  # ログイン済みユーザーのルートパス
  authenticated :user do
    root 'main_menu#index', as: :authenticated_root
  end

  resources :patients do
    resources :conditions, only: [:new, :create]
    collection do
      get 'search'
    end
    member do
      post 'select'
    end
  end
  
  resources :conditions, only: [:index, :edit, :update, :destroy]

  get 'main_menu', to: 'main_menu#index', as: :main_menu
  get 'settings', to: 'settings#index'
  get 'patients/search', to: 'patients#search'

  # Active Storageのルーティング（変更なし）
  get '/rails/active_storage/blobs/proxy/:signed_id/*filename', to: 'active_storage/blobs/proxy#show'
  get '/rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename', to: 'active_storage/representations/proxy#show'
  get '/rails/active_storage/blobs/redirect/:signed_id/*filename', to: 'active_storage/blobs/redirect#show'
  get '/rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename', to: 'active_storage/representations/redirect#show'
  get '/rails/active_storage/disk/:encoded_key/*filename', to: 'active_storage/disk#show'
  put '/rails/active_storage/disk/:encoded_token', to: 'active_storage/disk#update'
  post '/rails/active_storage/direct_uploads', to: 'active_storage/direct_uploads#create'

 
end