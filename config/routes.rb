Rails.application.routes.draw do
  get 'reports/index'
  get 'reports/show'
  get 'reports/new'
  get 'reports/edit'
  post "reports/new" => "reports#create"
  get "reports/api" => "reports#api"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
