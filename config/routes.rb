Rails.application.routes.draw do
  
  get "api/v1/login", to: "api/v1/users#spotify_authorization"
  
  delete "api/v1/logout", to: "api/v1/users#logout"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
