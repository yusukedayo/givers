Rails.application.routes.draw do
  root to: 'top_pages#top'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users, only: %i[new create]
  resources :articles do
    resources :comments, only: %i[create edit destroy update]
  end
end
