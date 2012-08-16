Rorworkout::Application.routes.draw do
  
  resource :welcome
  
  resources :doctors
  
  match "/my_appointments" => "appointments#index", :as => "my_appointments"
  
  resources :customers do
    resources :pets
    resources :appointments
  end
  
  
  # User login and other user related information
  resources :user_sessions
  resource :account do
    collection do
      get "password_reset"
      post 'send_password_reset'
      post "update_password"
    end
  end
  
  match "login" => "user_sessions#new", :as => "login"
  match 'logout', :to => 'user_sessions#destroy', :as => "logout"
  
  match 'signup', :to => 'accounts#new', :as => "signup"
  match "/account/edit_password/:perishable_token" => "accounts#edit_password", :as => "edit_password"
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'welcomes#show'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
