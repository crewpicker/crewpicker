FestivalAdmin::Application.routes.draw do
  get "statistics/index"

  resources :access_cards do
    get 'blank', :on => :member
  end

  match 'access_levels/:id/access_cards' => 'access_levels#access_cards', :as => :access_level_cards
  resources :access_levels

  match 'volunteers/migrate_data' => 'volunteers#migrate_data'
  resources :volunteers

  match 'groups/migrate_data' => 'groups#migrate_data'
  resources :groups

  resources :location_schedules

  resources :fireguards

  resources :locations do
    resources :location_schedules
  end

  resources :stages

  resources :bands do
    resources :band_members
  end

  resources :band_members

  get "home/index"
  root :to => "home#index"

  match 'program/:name' => 'stage_schedules#show_schedule', :as => :stage_schedule_program
  match 'stages/:id/schedule' => 'stage_schedules#show_schedule', :as => :stage_schedule_show
  match 'stages/:id/schedule/create' => 'stage_schedules#create', :as => :stage_schedule_create
  match 'stages/:id/schedule/move' => 'stage_schedules#move', :as => :stage_schedule_move
  match 'stages/:id/schedule/delete' => 'stage_schedules#delete', :as => :stage_schedule_delete
  match 'stages/:id/schedule/get_events' => 'stage_schedules#get_events', :as => :stage_schedule_get_events

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
