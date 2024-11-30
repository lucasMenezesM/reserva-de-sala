Rails.application.routes.draw do
  resources :reservations, only: [:index, :create, :destroy]
  resources :rooms
  resources :floors
  resources :buildings
  
  devise_for :users
  
  get 'about', to: "pages#about"
  root to: "pages#home"

  get "search_reservations", to: "reservations#search_reservations"
  get "search_rooms", to: "rooms#search_rooms"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
