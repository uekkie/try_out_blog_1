Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  root to: "posts#index"

  resources :posts, only: %i[index]
  
  resources :users, only: %i[index show edit update] do
    resources :posts, only: %i[new create edit update destroy]
    get :following, :followers, on: :member
  end

  scope module: :users do
    get "profile" 
  end

  resources :relationships, only: %i[create destroy]
end
