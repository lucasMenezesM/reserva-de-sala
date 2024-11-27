Rails.application.routes.draw do
  resources :reservations, only: [:create, :destroy]
  resources :rooms
  resources :floors
  resources :buildings
  
  devise_for :users
  
  get 'about', to: "pages#about"
  root to: "pages#home"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
