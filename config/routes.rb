Rails.application.routes.draw do
  resources :patients
  resources :users
  resources :days
  resources :months
end
