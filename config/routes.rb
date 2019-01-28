Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/songs', to: 'songs#index'
  # get '/songs/:id', to: 'songs#show'
  # get '/songs/:id/edit', to: 'songs#edit'
  # put '/songs/:id', to: 'songs#update'

  root 'songs#index'

  resources :songs
  resources :artists
  resources :playlists
end
