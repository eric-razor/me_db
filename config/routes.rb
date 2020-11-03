Rails.application.routes.draw do

  post "api/v1/login", to: "api/v1/sessions#create"
  post "api/v1/signup", to: "api/v1/users#create"
  delete "api/v1/logout", to: "api/v1/sessions#destroy"
  get "api/v1/user", to: "api/v1/sessions#get_user"
  
  get "api/v1/plants", to: "api/v1/plants#index"
  # resources :plants, only: [:index, :show]
  resources :plant_cards
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
