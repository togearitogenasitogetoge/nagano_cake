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
end