Rails.application.routes.draw do
  post 'locations/search'
  resources :addresses, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
