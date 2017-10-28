Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root 'home#index'

  resources :riders do
    resources :registers
  end

  get '/search_riders', to: 'riders#search_riders', as: 'search_riders'

  resources :races, :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
