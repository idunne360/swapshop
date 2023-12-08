Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html



  resources :listings do
    resources :comments, only: %i[new create]

    member do
      patch 'accept_offer/:comment_id', to: 'listings#accept_offer', as: 'accept_offer'
    end
  end
  root to: "listings#index"

end
