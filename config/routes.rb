Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "api/v1/jobs", to: "api/v1/jobs#index"
  get "api/v1/jobapps", to: "api/v1/jobapps#index"
end
