Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resource :users, only: [:create, :destroy]
  resource :login, only: [:create]
  resource :home, only: [:create]

end
