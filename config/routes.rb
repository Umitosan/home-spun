Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :home, only: [:index]

  resources :products do
    resources :comments
  end

  resources :order_items

  resources :accounts

  resources :orders

  resource :cart, only: [:show]

  resources :charges

end
