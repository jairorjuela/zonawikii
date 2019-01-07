Rails.application.routes.draw do

  get '/tasks/:id/set_done', to: 'tasks#set_done', as: 'task_set_done'

  root 'tasks#index'

  resources :tasks
end
