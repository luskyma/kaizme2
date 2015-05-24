Rails.application.routes.draw do
  get 'providers/find_a_provider'

  get 'dashboard/providers'
  get 'dashboard/patients'

  get 'dashboard/patient_profile'
  get 'dashboard/provider_profile'

  resources :appointments
  resources :availabilities
  devise_for :users, controllers: {registrations: "users/registrations"}

  root 'pages#splash'


   devise_scope :user do
    get 'providers/sign_up' => 'users/registrations#new'
  end


  resource :tok
  get 'tok/index' => 'toks#index'
  get 'tok/all' => 'toks#all'

  scope :format => true, :constraints => { :format => 'json' } do
    get 'tok/:tok_id/token' => 'toks#token'
  end

  get 'tok/:id' => 'toks#view'
  get 'tok/:id/close' => 'toks#close'
  get 'tok/new' => 'toks#new'

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
