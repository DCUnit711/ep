Rails.application.routes.draw do
  
  resources :passdowns

  resources :tickets

  get "tickets/index"
  get "tickets/new"
  get "tickets/edit"
  get "tickets/show"
  resources :inventory_types

  resources :statuses

  resources :devices

  resources :issue_types

  resources :issue_received_methods

  resources :ticket_issues

  resources :computer_images

  resources :computer_models

  resources :employees

  resources :copy_centers

  resources :locations

  resources :ps_connection_informations

  devise_for :users
  get "welcome/index"
  get "admin/index"

  resources :inventory

  resources :printers do 
    resources :comments
    resources :tickets do
      resources :ticket_issues
      resources :comments
    end
  end
  resources :computers do 
    resources :comments
    resources :tickets do
      resources :ticket_issues
      resources :comments
    end
  end
  resources :print_stations do 
    resources :comments
    resources :tickets do
      resources :ticket_issues
      resources :comments
    end
  end

  resources :tickets do
    resources :ticket_issues
    resources :comments
  end

  resources :printer_models

  authenticated :user do 
    root to: redirect('welcome/index'), as: :authenticated_root
  end

  devise_scope :user do
    root 'devise/sessions#new'
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
