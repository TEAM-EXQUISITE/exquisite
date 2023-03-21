Rails.application.routes.draw do
  get 'sessions/new'
  root "users#index"
  resources :users 
  resources :sessions, only: [:new, :create, :destory]
end
