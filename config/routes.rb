Rails.application.routes.draw do
  namespace :admin do
    root to: 'base#index'
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'projects#index'

  resources :projects do
    resources :tickets do
      member do
        post :watch
      end
    end
  end

  resources :tickets do
    resources :comments
  end

  resources :users
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  match '*path', to: 'errors#not_found', via: :all
end
