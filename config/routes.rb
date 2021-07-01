Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get '/ranking/:year', to: 'home#ranking', as: 'ranking'
  get '/races_of/:year', to: 'home#races_of_year', as: 'races_of_year'
  get '/races/results/:race_id', to: 'home#race_results', as: 'race_results'
  get "/road", to: 'home#road', as: "road"

  get '/donation/', to: 'home#donation', as: 'donation'
  root 'home#index'

  resources :riders do
    resources :registers
  end

  get '/search_riders', to: 'riders#search_riders', as: 'search_riders'

  resources :races, :categories

  mount API::Base, at: "/"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
