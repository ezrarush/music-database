Rails.application.routes.draw do
  get 'spotify_artists/index'

  get 'spotify_artists/show'

  resources :genres, shallow: true do
    resources :cds
    resources :lps
  end
    
  resources :artists, shallow: true do
    resources :cds
    resources :lps
  end

  resources :albums
  get '/random', to: 'albums#random'
  get '/export.xlsx', to: 'albums#export', as: 'export'
  
  get '/spotify_artists', to: 'spotify_artists#index'
  get '/spotify_artists/:id', to:'spotify_artists#show', as: 'spotify_artist'
  
  root 'artists#index'
end
