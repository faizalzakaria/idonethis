Rails.application.routes.draw do

  root to: "landing_pages#index"

  resources :users, :only => [] do
    resources :tasks, controller: 'users/tasks'
  end

  #resources :tasks
  devise_for :users
end
