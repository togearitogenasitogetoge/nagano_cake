Rails.application.routes.draw do


  namespace :admin do
    get 'orders/show'
  end
  #管理者用
  #URL/admin/sign_in...
  devise_for :admins,skip:[:registrations,:passwords],controllers:{
    sessions:'admin/sessions'
  }

  #顧客用
  #URL/customers/sign_in...
  devise_for :customers,controllers:{
    registrations:"public/registrations",
    sessions:'public/sessions'
  }

  scope module: :public do
    root to: "homes#top"
    get 'home/about' => "homes#about", as: "about"
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, only:[:new, :create, :index, :show]
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdrawal' => 'customers#withdrawal'
    delete '/cart_products/destroy_all' => 'cart_products#destroy_all'
    resources :cart_products, only:[:index, :update, :destroy, :create]
    resources :deliveries, only:[:index, :edit, :create, :update, :destroy]
    resources :products, only: [:index, :show]
    resources :genres, only: [:show]
  end

  scope module: :admin do
    get "admins" => "homes#top"
  end

  namespace :admin do
    resources :products, only: [:new, :create, :index, :show, :edit, :update]
    resources :genres, only: [:create, :index, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update] do
      member do
      resources :order_products, only:[:update]
      end
    end
  end

end