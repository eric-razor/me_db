Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      # assign '/' route to get_current_user
      post "/login", to: "users#login"
      post "/signup", to: "users#create"
      get "/user", to: "users#show"
      delete "/logout", to: "users#logout"
      resources :users, only: [:create]
    end
  end
end
