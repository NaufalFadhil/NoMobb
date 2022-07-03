Rails.application.routes.draw do
  namespace :api do
    resources :reports, only: [:index, :show, :create, :update, :destroy]
    resources :users, only: [:index, :show, :create, :update, :destroy]
    resources :accesses, only: [:index, :show, :create, :update, :destroy]
    resources :consultation_message, only: [:index, :show, :create, :update, :destroy]
    resources :community, only: [:index, :show, :create, :update, :destroy]
    get "checker" => "reports#check" 
    post "community/message" => "community#create_message" 
  end
  get 'reports/index'
  get 'reports/new'
  get 'reports/edit'
  get "reports/detail/:id" => "reports#show"
  post "reports/new" => "reports#create" 
  get "reports/api" => "reports#api"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
