Rails.application.routes.draw do
  namespace :api do
    get 'users', to: 'users#index'
    get 'users/:id', to: 'users#show'
    post 'users', to: 'users#create'
    get 'users/update'
    get 'users/destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
