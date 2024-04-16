Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  #ログイン後の遷移
  get "verify", :to => "users/registrations#verify"

  # ユーザーマイページのルート
  get 'mypage', to: 'users#show'

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "posts#index"

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
end
