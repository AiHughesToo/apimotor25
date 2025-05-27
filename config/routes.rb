Rails.application.routes.draw do
   devise_for :users
  resources :users

   #users
  post 'user' => 'users#create'
  post 'register', to: 'registrations#create'

  post 'sign_in', to: 'authentication#create'
  resources :jobs
end
