Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root to: "films#index"
  resources :films do
    resources :comments, only: [:new, :edit, :update, :create, :destroy]
  end
  resources :users, only: [:update, :edit]
end
