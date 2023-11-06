Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  get '/assign_roles', to: 'tickets#assign_roles', as: 'assign_roles'
  put '/update_role', to: 'tickets#update_role', as: 'update_role'
end
