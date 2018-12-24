Rails.application.routes.draw do
  devise_for :add_product_id_to_users
  mount StripeEvent::Engine, at: '/webhooks/stripe'
  
  devise_for :users, controllers: { registrations: "registrations" }
  
  resource :subscription
  
  resources :products
  resource :products
  
  #adding routes for product
  resources :product
  resource :product
  
  resources :charges
  
  root to: "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
