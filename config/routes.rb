Rails.application.routes.draw do
  namespace :admin do
    root to: 'base#index'
    resources :users
  end
  root 'projects#index'

  resources :projects do
    resources :tickets
  end

  resources :users
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :files

  match '*path', to: 'errors#not_found', via: :all
end
