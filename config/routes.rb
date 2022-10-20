Rails.application.routes.draw do


  #管理者用
  #URL/admin/sign_in...
  devise_for :admins,skip:[:registrations,:passwords],controllers:{
    sessions:'admin/sessions'
  }

  #顧客用
  #URL/customers/sign_in...
  devise_for :customers,skip:[:passwords],controllers:{
    registrations:"public/registrations",
    sessions:'public/sessions'
  }

  scope module: :public do
    resources :orders, only:[:new, :create, :index, :show] do
      collection do
        post :confirm
        get :complete
      end
    end
  end

  scope module: :admin do
    get "admins" => "homes#top"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :admin do
    resources :products, only: [:new, :create, :index, :show, :edit, :update]
    resources :genres, only: [:create, :index, :edit, :update]
  end


  #public/customersコントローラー
  scope module: :public do
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdrawal' => 'customers#withdrawal'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 顧客用-配送先
  scope module: :public do
    resources :deliveries, only:[:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    resources :customers, only:[:index, :show, :edit, :update]
  end

end