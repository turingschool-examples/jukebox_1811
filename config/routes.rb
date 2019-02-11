Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show]

  resources :artists, only: [:index, :show, :new, :create] do
    resources :songs, only: [:index, :new, :create, :edit, :update]
  end

  resources :songs, only: [:index, :show]

  namespace :admin do
    resources :categories, only: [:index]
  end
end
