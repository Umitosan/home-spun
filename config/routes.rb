Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :home, only: [:index]

  resources :accounts do
    resources :orders
  end

  # resources :accounts

  # resources :orders do
  #   resources :order_items
  # end
  resources :order_items

  resources :products do
    resources :comments
  end

  resource :cart, only: [:show]

  resources :charges

end
