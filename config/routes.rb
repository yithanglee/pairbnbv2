Rails.application.routes.draw do

  get '/search', to: 'listings#search'

  get 'payments/new', as: "new_payment"

  post 'payments/create', as: "payments"

  resources :listings do
    resources :reservations do
    end
  end

  resources :listing_tags
  resources :tags
  resources :users, except: [:destroy, :create, :new, :edit, :update, :show] do
    resources :listings
  end

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  patch 'staticpages/update' => "staticpages#update"
 
  get 'staticpages/profile'

  root 'staticpages#home'

  get 'staticpages/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
