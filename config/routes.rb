Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :uninsureds
  resources :insureds
  resources :days
  resources :months

  root 'months#index', as: 'root'
end
