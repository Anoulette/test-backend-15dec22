Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'listings#index'
  # reservations faites par le client
  resources :listings do
    resources :reservations
  end
  # c'est quand le proprio met en location son appart
  resources :bookings
end
