Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  get 'orders/new'
  get 'orders/index'
  get 'orders/show'
  get 'cart_items/index'
  get 'customers/show'
  get 'customers/edit'
  get 'items/index'
  get 'items/show'
  get 'homes/top'
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
