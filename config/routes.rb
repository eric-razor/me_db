Rails.application.routes.draw do


  resources :categories
  resources :comments
  resources :posts
  namespace :api do
    namespace :v1 do
      # assign '/' route to get_current_user
      post "/login", to: "users#login"
      post "/signup", to: "users#create"
      get "/user", to: "users#get_user"
      delete "/logout", to: "users#logout"
      resources :users, only: [:create]
    end
  end
end
