FestivalAdmin::Application.routes.draw do
  resource :active_event

  resources :crew_merchandise_order_lines

  resources :crew_merchandise_orders

  resources :merchandise_article_variants

  resources :merchandise_articles

  resources :events

  resources :roles

  resources :crew_wishes

  resources :crew_applications do
    get 'hidden', :on => :collection
    get 'unhide', :on => :member
  end

  match 'crewskjema' => 'crew_applications#new', via: :get

  resources :user_sessions
  resources :users do
    get 'communication_consent', on: :member
  end

  match 'login' => 'user_sessions#new', :as => :login, via: :get
  match 'logout' => 'user_sessions#destroy', :as => :logout, via: :get

  match "oauth/callback" => "oauths#callback", via: :get
  match "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider, via: :get

  resource :flightscreen do
    get 'now'
    get 'next'
    get 'later'
  end

  resources :stage_schedules do
    get 'list', on: :collection
    get 'update', on: :collection
  end

  resources :ads do
    post 'copy_ads_from_event', on: :collection
    get 'toggle_completed', on: :member
  end

  resources :ad_types

  resources :statistics

  resources :access_cards do
    get 'blank', :on => :member
  end

  match 'access_levels/:id/access_cards' => 'access_levels#access_cards', :as => :access_level_cards, via: :get
  resources :access_levels

  match 'volunteers/migrate_data' => 'volunteers#migrate_data', via: :get
  resources :volunteers do
    collection do
      get 'compact'
      get 'info'
      get 'mailer'
      post 'mail'
    end
  end

  match 'groups/migrate_data' => 'groups#migrate_data', via: :get
  resources :groups do
    resources :volunteers
    resources :crew_applications do
      get 'choose', :on => :member
    end
  end

  resources :location_schedules

  resources :fireguards

  resources :locations do
    resources :location_schedules
  end

  resources :stages do
    resources :stage_schedules
  end

  resources :bands do
    collection do
      get 'info'
      get 'mailer'
      post 'mail'
    end
    resources :band_members
  end

  resources :band_members
  resources :band_orders do
    get 'delay', :on => :collection
  end

  get "home/index"
  root :to => "home#index"
  match 'setup' => 'home#setup', as: :setup_wizard, via: :get

  match 'program/:name' => 'stage_schedules#index', :as => :stage_schedule_program, via: :get
  match 'program/:name/print' => 'stage_schedules#print', :as => :stage_schedule_program_print, via: :get

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
