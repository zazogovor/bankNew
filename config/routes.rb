Rails.application.routes.draw do
  
  resources :transactions

  resources :employees

  controller :sessions do
	get 'login' => :new
	post 'login' => :create
	get 'logout' => :destroy
	delete 'logout' => :destroy
	get 'employeelogin' => :employeenew
	post 'employeelogin' => :employeecreate
	get 'employeelogout' => :employeedestroy
	delete 'employeelogout' => :employeedestroy
  end

  get 'pages/home'

  get 'pages/about'
  
  get '/all_customers' => 'customers#all_customers'
  get '/all_accounts' => 'accounts#all_accounts'
  get '/all_cards' => 'cards#all_cards'
  get '/all_transactions' => 'transactions#all_transactions'
  
  #get '/customers/:id', to 'customers#show', as: 'details'
  
  get 'search', :to => 'transactions#search'
  get 'searchCustomers', :to => 'customers#search'
  get 'searchCards', :to => 'cards#search'
  get 'searchAccounts', :to => 'accounts#search'

  resources :cards

  resources :accounts

  resources :customers

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

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
