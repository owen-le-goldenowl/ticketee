Rails.application.routes.draw do
  get 'users/create'
  get 'users/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'projects#index'
  resources :projects do
    resources :tickets
  end
  resources :users
  match '*path', to: 'errors#not_found', via: :all
end
