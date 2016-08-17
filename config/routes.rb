Rails.application.routes.draw do
  get 'admin/index'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :users
  resources :orders
  resources :line_items
  resources :carts
  root  'store#index'

  resources :products  do
    get  :who_bought,  on:  :member
  end

  get  'admin'  =>  'admin#index'

  controller  :sessions  do
    get  'login'  =>  :new
    post  'login'  =>  :create
    delete  'logout'  =>  :destroy
  end

end
