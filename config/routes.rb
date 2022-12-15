Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :listings, only: [:index, :show, :create, :update, :destroy]
      resources :missions, only: :index
    end
  end

  # reservations faites par le client
  # c'est quand le proprio met en location son appart

end
