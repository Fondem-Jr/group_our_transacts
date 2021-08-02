Rails.application.routes.draw do
  resources :transfers
  resources :groups
  get 'admin/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'sessions/new'
  get 'sessions/creat'
  get 'sessions/destroy'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
