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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 顧客用-配送先
  scope module: :public do
    resources :deliveries, only:[:index, :edit, :create, :update, :destroy]
  end

  scope module: :admin do
    resources :customers, only:[:index, :show, :edit, :update]
  end

end
