Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flights, only: :index
  resources :transactions, only: %i[create new index]

  get "🛩", to: 'flights#index'

  root 'flights#index'
end
