Rails.application.routes.draw do

  resources :plants, only: [:index, :show]
  resources :plant_cards
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
