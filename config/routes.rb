Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: [:create, :index]
  resources :farms, only: [:index]

  post 'login', to: 'auth#login'
  post 'logout', to: 'auth#logout'

  get 'user/:id', to: 'users#show'
  post 'users/test', to: 'users#create_farm'

  post 'user/:id/farm', to: 'farms#create_farm'

  # Defines the root path route ("/")
  # root "posts#index"
end
