Rails.application.routes.draw do
  # root to: 'public/homes#top'
  # get '/about' => 'public/homes#about', as: 'about'

  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  # resources :items, only: [:index, :show]
  # get 'customers/my_page' => 'public/customers#show'
  # get 'customers/edit'
  # patch 'customers/update'
  # get 'customers/check'
  # patch 'customers/withdraw'
  # resources :cart_items, only: [:index, :create, :update, :destroy]
  # delete 'cart_items/destroy_all'
  # resources :orders, only: [:new, :index, :show]
  # patch 'orders/update'
  # get 'orders/check'
  # get 'orders/complete'

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
