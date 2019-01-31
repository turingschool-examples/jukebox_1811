Rails.application.routes.draw do

  # root 'songs#index'

  # resources :songs, only: [:index, :show, :edit, :update]
  # resources :artists
  # resources :playlists

  resources :artists do
    resources :songs, only: [:new, :create]
  end

  resources :songs, only: [:index, :show, :update, :edit]
end
