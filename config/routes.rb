Rails.application.routes.draw do
  devise_for :admin,skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

   namespace :admin do
   resources :items, only: [:index, :create, :new, :show, :edit, :update, :destroy]
   resources :genres, only: [:index, :edit, :create, :update, :new]
   resources :customers, only: [:index, :show, :edit, :update]
   end

  scope module: :public do
  resources :customers, only: [:show, :edit, :update]
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:index, :create, :destroy, :update]
   post "/orders/confirm" => "orders#confirm"
   get "/orders/complete" => "orders#complete"
  resources :orders, only: [:new, :create, :show, :index]

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
end
