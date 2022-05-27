Rails.application.routes.draw do

 # 顧客用
 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
 }
 get 'about' => 'public/homes#about'
 root 'public/items#top'

 scope module: :public do
  resources :items,only: [:index,:show]
  resources :admins
  resources :customers,only: [:edit,:update,:show] do
  	collection do
  	 get 'unsubscribe'
  	 patch 'out'
  	end
  end

  resources :cart_items,only: [:index,:update,:create,:destroy] do
    collection do
      delete '/' => 'cart_items#all_destroy'
    end
  end

  resources :addresses,only: [:index,:create,:edit,:update,:destroy]

  resources :orders,only: [:new,:index,:show,:create] do
   collection do
    post 'confirm'
    get 'thanx'
   end
  end
 end

# 管理者用
 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
 }


  namespace :admin do
    get '/admins' => 'admins#top'
    resources :items
    resources :genres
    resources :customers
    resources :orders
    resources :order_items
  end

end
