Rails.application.routes.draw do
  resources :posts
  devise_for :users

  # ユーザーマイページのルート
  get 'mypage', to: 'users#show'

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "posts#index"
end
