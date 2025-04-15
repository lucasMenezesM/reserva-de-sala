Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :institutions do
    get :manage, on: :collection
  end
  resources :reservations, only: [:index, :create, :destroy]
  resources :rooms
  resources :floors
  resources :buildings
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  get 'about', to: "pages#about"
  root to: "pages#home"

  # Select institution
  get "select_institution", to: "institutions#select_institution"

  # Search methods
  get "search_reservations", to: "reservations#search_reservations"
  get "search_rooms", to: "rooms#search_rooms"
  get "search_floors", to: "floors#search_floors"
  get "search_buildings", to: "buildings#search_buildings"
  
  post "render_reservation_form", to: "rooms#render_reservation_form"

  # Handling Errors
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server_error'
  get '/401', to: 'errors#unauthorized'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
