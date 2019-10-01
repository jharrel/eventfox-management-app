Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root "static#welcome"

  resources :sessions

  resources :users, only: [:new, :create] do
    resources :tasks, only: [:index, :show, :new]
  end

  resources :projects

  resources :tasks

  #get '/users/:id/tasks' to: 'users#show'

  get '/signout', to: 'sessions#destroy'

  get '/tasks/:id/complete', to: "tasks#complete"

  delete 'tasks/:id', to: "tasks#destroy", as: "delete_task"

  #get 'tasks/:id/delete', to: "tasks#delete"

  get '/auth/facebook/callback' => 'sessions#create'

  # get 'projects/:id/delete', to: "projects#delete"
end
