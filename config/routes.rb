Rails.application.routes.draw do
  root to: "public/homes#top"

  devise_for :admins, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  namespace :admin do
    resources :order_details, only: [:update]
  end
  namespace :admin do
    resources :orders, only: [:show, :update]
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  namespace :admin do
    root to: "homes#top"
  end
  namespace :public do
    resources :destinations, only: [:index, :create, :edit, :update, :destroy]
  end
  namespace :public do
    get 'orders/complete'
    get 'orders/confirm'
    post 'orders/confirm'
    resources :orders, only: [:new, :create, :index, :show]
  end
  namespace :public do
    resources :cart_items, only: [:create, :index, :update, :destroy] do
      collection do
        delete 'cart_items/destroy_all', as: 'cart_items_destroy_all'
      end
    end
  end
  namespace :public do
    resource :customers, only: [:show, :edit, :update] do
      collection do
        get :confirm
        patch :withdraw
      end
    end
    get 'customers/confirm'
    #patch 'customers' => 'customers#withdraw', as: 'withdraw'
  end
  namespace :public do
    resources :items, only: [:index, :show]
  end
  namespace :public do
    root to: "homes#top"
    get 'homes/about', as: 'about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
