Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # assign '/' route to get_current_user
      post "/login", to: "users#login"
      post "/signup", to: "users#create"
      delete "/logout", to: "users#logout"
      get "/user", to: "users#get_user"

      resources :users, only: [:create]
      resources :categories
      resources :comments
      resources :posts
    end
  end
end
