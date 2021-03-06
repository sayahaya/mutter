Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users, only: %i[create new index show] do
    member do
      get :following, :followers
    end
  end
  resources :mutters, only: %i[show create destroy]
  resources :relationships, only: %i[create destroy]
  resources :likes, only: %i[create destroy]
end
