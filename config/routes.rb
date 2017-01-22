Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :months
  resources :days

  root 'landing#month', as: 'root'
end
