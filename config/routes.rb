Rails.application.routes.draw do

  get "api/v1/plants", to: "api/v1/plants#index"
  # resources :plants, only: [:index, :show]
  resources :plant_cards
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
