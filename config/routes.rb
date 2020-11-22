Rails.application.routes.draw do

  post "api/v1/login", to: "api/v1/users#login"
  get "api/v1/spotify_login", to: "api/v1/users#spotify_login"
  post "api/v1/signup", to: "api/v1/users#create"
  delete "api/v1/logout", to: "api/v1/users#logout"
  get "api/v1/user", to: "api/v1/users#get_user"
  get "api/v1/account", to: "api/v1/users#account"
  
  get "api/v1/plants", to: "api/v1/plants#index"
  # resources :plants, only: [:index, :show]
  resources :plant_cards
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
