Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post "/login", to: "users#login"
      get "/user", to: "users#show"
      delete "/logout", to: "users#logout"
      resources :users, only: [:create]
    end
  end
end
