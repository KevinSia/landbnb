Rails.application.routes.draw do


  root 'static#home'
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get '/about' => "static#about"
  get '/dashboard' => "static#dashboard"
  get '/tag/:tag' => "static#tag", as: "tag"
  get "/auth/:provider/callback" => "sessions#create_user_from_omniauth"


  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  # overring clearance::userscontroller
  scope module: 'user' do
    resources :users, controller: "users", only: [:create, :show, :edit, :update] do
      resources :listings, controller: 'listings'
      resource :password,
        controller: "clearance/passwords",
        only: [:create, :edit, :update]
    end
  end

  scope module: 'public' do
    resources :listings, only: [:index, :show]
  end
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
