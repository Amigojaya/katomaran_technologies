Rails.application.routes.draw do
  resources :bookings, only: %i[index new create edit update] do
    collection do
      get 'all_bookings'
    end
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  get '/assign_roles', to: 'user_managment#assign_roles', as: 'assign_roles'
  put '/update_role', to: 'user_managment#update_role', as: 'update_role'

  get '/list_users', to: 'user_managment#users_list_for_admins', as: 'users_list_for_admins'
  put '/block_user', to: 'user_managment#block_user', as: 'block_user'
end
