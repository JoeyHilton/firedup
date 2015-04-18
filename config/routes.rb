Rails.application.routes.draw do

  # get 'jboards/index'

  # get 'jboards/show'

  # get 'jboards/new'

  # get 'jboards/create'

  # get 'jboards/update'

  # get 'jboards/destroy'

  # get 'jboards/edit'

  root 'static#home'

  devise_for :users, :controllers => {:registrations => 'registrations', :sessions => 'sessions',
  :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, :only => [:show, :index]

  get '/profile', to: 'users#profile', as: :profile
  get '/posts/feed', to: 'posts#feed', as: :feed

  shallow do
    resources :users do
      resources :jobs
      resources :certs
      resources :educations
      resources :messages
      resources :posts
      resources :jboards
    end
  end

  

  get 'static/about'
  get 'static/tour'
  get 'static/contact'
  
   get '/connect', to: 'users#connect', as: :connect
  


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
