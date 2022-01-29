Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  root to: 'tasks#index'
  resources :tasks
  resources :users, only: %i[ new show edit create destroy ]
  resources :sessions, only: %i[ new create destroy ]
end
