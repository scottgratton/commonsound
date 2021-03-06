Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :songs, only: %i[new create index]
  resources :artists
  resources :albums

  root 'artists#index'
end
