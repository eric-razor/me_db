Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get "login", to: "users#spotify_authorization"
      delete "logout", to: "users#logout"
    end
  end
end
