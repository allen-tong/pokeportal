Rails.application.routes.draw do
  devise_for :trainers
  root to: "home#index"
  resources :trainers
  patch '/capture', to: 'pokemons#capture', as: 'capture'
  patch '/damage', to: 'pokemons#damage', as: 'damage'
  get '/new', to: 'pokemons#new', as: 'new'
  post '/create', to: 'pokemons#create', as: 'create'
end
