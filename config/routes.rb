Rails.application.routes.draw do
  resources :transfers
  resources :groups
  #get 'admin/index'
  #get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users

  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  get 'transfers_all', to: 'transfers#index_all'

  root 'admin#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
