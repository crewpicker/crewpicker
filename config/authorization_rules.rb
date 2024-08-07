authorization do
  role :admin do
    has_permission_on %i[users crew_applications volunteers groups roles bands band_members access_levels access_cards
                         fireguards locations location_schedules stages stage_schedules ads ad_types events statistics
                         home active_events tk81_skuespillere tk81_teknikere], :to => [:manage]
  end

  role :groupleader do
    includes :admin
  end

  role :user do
    includes :guest
    has_permission_on :bands, :to => [:new, :create, :info]
    has_permission_on :bands, :to => [:edit, :update, :show, :destroy] do
      if_attribute :user_id => is { user.id }
    end
    has_permission_on :band_members, :to => [:new, :create]
    has_permission_on :band_members, :to => [:edit, :update, :show, :destroy] do
      if_attribute :user_id => is { user.id }
    end
    has_permission_on :crew_applications, :to => [:new, :create]
    has_permission_on :crew_applications, :to => [:edit, :update, :show, :destroy] do
      if_attribute :user_id => is { user.id }
    end
    has_permission_on :crew_wishes, :to => [:new, :create]
    has_permission_on :crew_wishes, :to => [:edit, :update, :show, :destroy] do
      if_attribute :user_id => is { user.id }
    end
    has_permission_on :users, :to => [:edit, :update, :show] do
      if_attribute :id => is { user.id }
    end
    has_permission_on :home, :to => [:index, :setup]
    has_permission_on :volunteers, :to => :info
    has_permission_on :tk81_skuespillere, :to => [:new, :create]
    has_permission_on :tk81_skuespillere, :to => [:edit, :update, :show, :destroy] do
      if_attribute :user_id => is { user.id }
    end
    has_permission_on :tk81_teknikere, :to => [:new, :create]
    has_permission_on :tk81_teknikere, :to => [:edit, :update, :show, :destroy] do
      if_attribute :user_id => is { user.id }
    end
  end

  role :guest do
    has_permission_on :home, :to => [:index, :setup]
    has_permission_on :users, :to => [:new, :create]
    has_permission_on :location_schedules, :to => [:create]
  end
end
privileges do
  privilege :manage do
    includes :new, :create, :show, :index, :list, :edit, :update, :destroy, :choose, :mail, :setup, :copy_ads_from_event, :toggle_completed
  end
end
