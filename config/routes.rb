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
  resources :shopping_addresses, only: [:index, :create, :destroy, :edit, :update]
  resources :customers, only: [:show, :edit, :update, :like] do
     member do
      get :like
     end
  end
  resources :items, only: [:index, :show] do
  resources :likes, only: [:create, :destroy]
  end
  delete "/cart_items/destroy_all" => "cart_items#destroy_all"
  resources :cart_items, only: [:index, :create, :destroy, :update]
  post "/orders/confirm" => "orders#confirm"
  get "/orders/complete" => "orders#complete"
  resources :orders, only: [:new, :create, :show, :index]
  root "homes#top"
  get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
  patch '/customers/:id/withdraw' => 'customers#withdraw', as: 'withdraw'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get 'search' => "searches#search"
end
