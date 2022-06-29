Rails.application.routes.draw do
  namespace :api do
    get 'users/index'
    get 'users/show'
    get 'users/create'
    get 'users/update'
    get 'users/destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
