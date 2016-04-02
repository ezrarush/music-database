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
  get '/export.xlsx', to: 'albums#export', as: 'export'   
  
  root 'artists#index'
end
