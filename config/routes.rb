Rails.application.routes.draw do

  root 'static_pages#home'

  get 'help' => 'static_pages#help'

  get 'about' => 'static_pages#about'

  get 'contact' => 'static_pages#contact'

  get 'signup' => 'users#new'
  resources :users
  resources :companies
  get '/users/:id/password_edit', to: 'users#editpass', as: 'password_edit'
  patch '/users/:id/password_edit', to: 'users#updatepass'
  get '/register/:id', to: 'users#register'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'admin_login' => 'sessions#new_admin'
  post 'admin_login' => 'sessions#create_admin'
  delete 'logout' => 'sessions#destroy'

  get 'admin' => 'admin#index'
  get 'stats' => 'admin#stats'


  get '/company_list' => 'getrequest#getcompanylist'
  get '/company_by_branch' => 'getrequest#company_by_branch'
  post '/apply/:id' => 'users#apply'
  post '/cancel/:id' => 'users#cancel_application'
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
