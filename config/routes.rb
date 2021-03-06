Rails.application.routes.draw do

  root 'static#home'

  devise_for :users, :controllers => {:registrations => 'registrations', :sessions => 'sessions',
  :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, :only => [:show, :index]

  resources :jsearches, :only => [:new, :create, :show]
  resources :msearches, :only => [:new, :create, :show]

  get '/profile', to: 'users#profile', as: :profile
  get '/posts/feed', to: 'posts#feed', as: :feed
  resources :jboards, :only => [:index]

  shallow do
    resources :users do
      resources :tasks
      resources :jobs
      resources :certs
      resources :educations
      resources :messages
      resources :jboards, :except => [:index]
      resources :ces
      resources :posts do
        resources :comments, except: [:index, :show]
      end
    end
  end

  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]
  

  get 'static/about'
  get 'static/tour'
  get 'static/contact'
  
  get '/connect/:id', to: 'users#connect', as: :connect
  get '/pending_connection', to: 'users#pending_connection', as: :pending_connection
  get '/approve_connection/:id', to: 'users#approve_connection', as: :approve
  get '/disconnect/:id', to: 'users#disconnect', as: :disconnect
  get '/archive/:id', to: 'messages#archive', as: :archive
  get '/received_messages/:user_id', to: 'messages#received_messages', as: :received_messages
  get '/sent_messages/:user_id', to: 'messages#sent_messages', as: :sent_messages
  get '/archived_messages/:user_id', to: 'messages#archived_messages', as: :archived_messages
  get '/message_history/:user_id', to: 'messages#message_history', as: :message_history
  get '/pictured_connection/:user_id', to: 'posts#pictured_connection', as: :pictured_connection
  


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
