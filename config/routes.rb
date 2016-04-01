Rails.application.routes.draw do
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
  
  root 'artists#index'
end
