Rails.application.routes.draw do
  devise_for :users

  # ユーザーマイページのルート
  get 'mypage', to: 'users#show'

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "posts#index"

  resources :posts do
    resources :comments, only: [:create]
  end
end
