Rails.application.routes.draw do
  rdevise_for :users
  root 'patients#index'
  
  resources :patients, except: [:show] do
    post 'select', on: :member
  end
  
  resources :conditions
  get 'main_menu', to: 'main_menu#index'
  get 'settings', to: 'settings#index'

  # Active Storageのルーティングを追加
  Rails.application.routes.draw do
    # Active Storageのルーティングを明示的に追加
    get '/rails/active_storage/blobs/proxy/:signed_id/*filename', to: 'active_storage/blobs/proxy#show'
    get '/rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename', to: 'active_storage/representations/proxy#show'
    get '/rails/active_storage/blobs/redirect/:signed_id/*filename', to: 'active_storage/blobs/redirect#show'
    get '/rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename', to: 'active_storage/representations/redirect#show'
    get '/rails/active_storage/disk/:encoded_key/*filename', to: 'active_storage/disk#show'
    put '/rails/active_storage/disk/:encoded_token', to: 'active_storage/disk#update'
    post '/rails/active_storage/direct_uploads', to: 'active_storage/direct_uploads#create'
  end

  # この行は最後に置いてください
  get '*unmatched_route', to: 'application#route_not_found'
end