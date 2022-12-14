Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    resources :users, only: :create
    resource :session, only: [:show, :create, :destroy]
    resources :products, only: [:index]
    get '/products/:product_name', to: 'products#show'
    get '/products/search/:query', to: 'products#search'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :reviews, only: [:create, :update, :destroy]
    get '/products/:product_name/reviews', to: 'reviews#index'
  end
  
  get '*path', to: "static_pages#frontend_index"
end
