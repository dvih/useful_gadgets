Rails.application.routes.draw do
  post 'products/search' => 'category#search', as: 'search_products'

  get '' => 'category#index', as: 'index'

  get '/:id' => 'category#show', as: 'show', id: /\d+/

  get '/product/:id' => 'product#show', as: 'show_product', id: /\d+/

  get '/cart'=> 'product#show_cart', as: 'cart'

  get 'products/change_quantity' => 'product#change_quantity'

  resources :product, only: [:index] do
    member do
      post :remove_from_cart
      post :add_to_cart
    end
  end


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
