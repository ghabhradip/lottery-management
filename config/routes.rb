Rails.application.routes.draw do
  root 'home#index'
  get 'lottery/index'

  get 'lottery/new'
  post 'lottery/create' => 'lottery#create'


  get 'lottery/edit'

  patch 'lottery/update'

  get 'customer/index'

  get 'customer/new'
  get '/customer/:id/edit' => 'customer#edit'
  post '/customer/create' => 'customer#create'

  patch '/customer/:id/update' => 'customer#update'

  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "home#dashboard"

  # devise_scope :user do
	 #  root to: "devise/sessions#new"
  # end
  devise_for :users, controllers: {sessions: "session"}

  get 'home/dashboard' => "home#dashboard"

  get '/transaction/new'

  post '/transaction/create', as: :transaction_create
  get "/get_customers" => "customer#get_customers"
  get "/get_lotteries" => "lottery#get_lotteries"

  get '/lottery/:id' => 'lottery#show'
end
