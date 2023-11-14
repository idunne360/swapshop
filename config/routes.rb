Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  resources :listings do
    resources :comments, only: %i[new create]
  end
  root to: "listings#index"

  # Defines the root path route ("/")
  # root "articles#index"
end
