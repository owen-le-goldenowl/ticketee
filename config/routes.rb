Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'projects#index'

  resources :users
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  resources :projects do
    resources :tickets
  end

  # match '*path', to: 'errors#not_found', via: :all
end
