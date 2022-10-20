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

  #public/customersコントローラー
  scope module: :public do
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    put 'customers/information' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdrawal' => 'customers#withdrawal'
  end

  #admin/customersコントローラー
   resources :customers,only:[:index,:show,:edit,:update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 顧客用-配送先
  scope module: :public do
    resources :deliveries, only:[:index, :edit, :create, :update, :destroy]
  end

  scope module: :admin do
    resources :customers, only:[:index, :show, :edit, :update]
  end

end
