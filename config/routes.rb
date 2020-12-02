Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items
  resources :items do
    resources :orders, only: [:index, :create]
  end  
  # resources :orders, only: [:index, :create] do
  #   resources :addresses, only: :create
  # end  
end
