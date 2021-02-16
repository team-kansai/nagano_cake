Rails.application.routes.draw do
  devise_for :customers

  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'

  scope module: :public do
    resource :customers, only: [:edit, :update]
    get 'customers/my_page' => 'customers#show'
    patch 'customers/withdraw' => 'customers#withdraw'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :products, only: [:index, :show]
    resources :cart_products, only: [:index, :create, :update, :destroy]
    delete 'cart_products/destroy_all' => 'cart_products#destroy_all'
    resources :orders, only: [:new, :index, :show, :create]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
  end
  
  namespace :admin do
    get '/' => 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :products, except: [:destroy]
    resources :orders, only: [:show, :update] do
      resources :ordered_products, only: [:update]
    end
    resources :genres, only: [:index, :edit, :create, :update]
  end
  


  


end
