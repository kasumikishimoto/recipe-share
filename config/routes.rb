Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
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
  resources :users, only: [:show, :new, :index]

  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end