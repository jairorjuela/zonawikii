Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  root 'tasks#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :tasks

  get '/tasks/:id/set_done', to: 'tasks#set_done', as: 'task_set_done'
end
