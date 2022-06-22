Rails.application.routes.draw do
  get 'reports/index'
  get 'reports/show'
  get 'reports/edit'
  get 'reports/update'
  get 'reports/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
