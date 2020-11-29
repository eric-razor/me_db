Rails.application.routes.draw do

  post "api/v1/login", to: "api/v1/users#login"
  
  get "auth/spotify/callback", to: "api/v1/users#spotify_authorization"

  post "api/v1/signup", to: "api/v1/users#create"
  delete "api/v1/logout", to: "api/v1/users#logout"
  get "api/v1/user", to: "api/v1/users#get_user"
  get "api/v1/account", to: "api/v1/users#account"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
