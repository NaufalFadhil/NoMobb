Rails.application.routes.draw do
  get 'index/show'
  get 'index/edit'
  get 'index/update'
  get 'index/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
