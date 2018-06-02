Rails.application.routes.draw do
  resources :songs
  root to: 'home#index'
end
