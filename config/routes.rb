Rails.application.routes.draw do

  root to: "tasks#index"

  resources :tasks, only: [:index]
  resources :users, :only => [] do
    resources :tasks, controller: 'users/tasks'
  end

  post '/github/payload', to: 'github#payload'

  devise_for :users
end
