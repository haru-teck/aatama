Rails.application.routes.draw do
  root 'main_menu#index'  # ルートパスを設定

  resources :conditions
  resources :users

  # main_menu のルートを追加
  get 'main_menu', to: 'main_menu#index', as: :main_menu
end

