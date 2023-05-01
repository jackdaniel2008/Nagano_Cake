Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show]
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get 'customers/my_page' => 'customers#show'
    get 'customers/my_page/edit' => 'customers#edit'
    patch 'customers/update'
    get 'customers/check'
    patch 'customers/withdraw'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items/destroy_all'
    resources :orders, only: [:new, :index, :show]
    patch 'orders/update'
    get 'orders/check'
    get 'orders/complete'
  end





  # namespace :admin do
  #   get '' => 'admin/homes#top'
  # end
  # namespace :admin do
  #   resources :items, only: [:new, :index, :show, :edit, :create, :update]
  # end
  # namespace :admin do
  #   resources :customers, only: [:index, :show, :edit, :update]
  # end
  # namespace :admin do
  #   resources :orders, only: [:show]
  # end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
