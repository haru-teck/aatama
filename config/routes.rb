Rails.application.routes.draw do
  devise_for :users

  # ログインしていないユーザーのルートパス
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  # ログイン済みユーザーのルートパス
  authenticated :user do
    root 'patients#index', as: :authenticated_root
  end

  resources :patients, except: [:show] do
    post 'select', on: :member
    resources :conditions  # この行を追加
  end
  
  resources :conditions  # この行はそのまま残す

  get 'main_menu', to: 'main_menu#index'
  resources :patients do
    resources :conditions, shallow: true
  end
  get 'settings', to: 'settings#index'

  # Active Storageのルーティング
  get '/rails/active_storage/blobs/proxy/:signed_id/*filename', to: 'active_storage/blobs/proxy#show'
  get '/rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename', to: 'active_storage/representations/proxy#show'
  get '/rails/active_storage/blobs/redirect/:signed_id/*filename', to: 'active_storage/blobs/redirect#show'
  get '/rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename', to: 'active_storage/representations/redirect#show'
  get '/rails/active_storage/disk/:encoded_key/*filename', to: 'active_storage/disk#show'
  put '/rails/active_storage/disk/:encoded_token', to: 'active_storage/disk#update'
  post '/rails/active_storage/direct_uploads', to: 'active_storage/direct_uploads#create'

  # 未マッチのルート
  get '*unmatched_route', to: 'application#route_not_found'
end