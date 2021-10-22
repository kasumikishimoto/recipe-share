Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"
  resources :recipes do
    resources :comments, only: :create
      collection do
        get 'search'
      end
      collection do
        get 'research'
      end
  end
  resources :users, only: :show
  end