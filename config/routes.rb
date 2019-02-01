Rails.application.routes.draw do
  root 'songs#index'

  resources :artists, only: [:index, :show, :new, :create] do
    resources :songs, only: [:index, :new, :create, :edit, :update]
  end

  resources :songs, only: [:index, :show]
end
