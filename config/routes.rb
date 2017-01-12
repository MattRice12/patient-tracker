Rails.application.routes.draw do
  resources :uninsureds
  resources :insureds
  resources :users
  resources :days
  resources :months

  root 'months#index', as: 'root'
end
