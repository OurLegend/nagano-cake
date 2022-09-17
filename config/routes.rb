Rails.application.routes.draw do
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
    get 'homes/top'
  end
  namespace :public do
    resources :destinations, only: [:index, :create, :edit, :update, :destroy]
  end
  namespace :public do
    resources :orders, only: [:new, :create, :index, :show]
    get 'orders/confirm'
    get 'orders/complete'
  end
  namespace :public do
    resources :cart_items, only: [:create, :index, :update, :destroy]
    delete 'cart_items/destroy_all'
  end
  namespace :public do
    resource :customers, only: [:show, :edit, :update]
    get 'customers/confirm'
    patch 'customers' => 'customers#destroy', as: 'destroy'
  end
  namespace :public do
    resources :items, only: [:index, :show]
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
