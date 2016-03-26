Rails.application.routes.draw do
  resources :albums
  resources :cds
  resources :lps
  
  root 'albums#index'
end
