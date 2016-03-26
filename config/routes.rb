Rails.application.routes.draw do
  resources :artists, shallow: true do
    resources :cds
    resources :lps
  end

  resources :albums
  
  root 'artists#index'
end
