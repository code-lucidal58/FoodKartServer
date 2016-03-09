Rails.application.routes.draw do
  resources :confirms
  get '/users' => 'users#index', defaults: {format:'json'}
  post '/users' => 'users#create', defaults: {format:'json'}
  put '/users' => 'users#update', defaults: {format:'json'}
  delete '/users' => 'users#destroy', defaults: {format:'json'}
  post '/users/login' => 'users#login', defaults: {format:'json'}
  get '/users/logout' => 'users#logout', defaults: {format:'json'}

  get '/orders' => 'orders#index', defaults: {format:'json'}
  post '/orders' => 'orders#create', defaults: {format:'json'}
  delete '/orders/:id' => 'orders#destroy', defaults: {format:'json'}
  get '/orders/restaurant_list' => 'orders#restaurant_list', defaults: {format:'json'}
  post '/orders/restaurant_orders' => 'orders#restaurant_orders', defaults: {format:'json'}

  get '/requests' => 'requests#index', defaults: {format:'json'}
  post '/requests' => 'requests#create', defaults: {format:'json'}
  put '/requests/:id' => 'requests#update', defaults: {format:'json'}
  post '/requests/retrieve_requests'=>'requests#retrieve_requests', defaults: {format:'json'}
  post '/requests/confirm_order' =>'requests#confirm_order'

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
