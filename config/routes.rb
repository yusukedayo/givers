Rails.application.routes.draw do
  root to: 'user_sessions#new'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users, only: %i[new create]
  resources :articles do
    resources :comments, only: %i[create edit destroy update]
    collection do
      get :likes
      get :search
    end
  end
  resources :likes, only: %i[create destroy]
  resources :topics, only: %i[index] do
    collection do
      get :introduction
      get :basis
      get :advance
    end
  end
  resource :profile, only: %i[show edit update]
end
