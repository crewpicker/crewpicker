authorization do
  role :admin do
    has_permission_on [:users, :crew_applications, :volunteers, :groups, :roles, :bands, :band_members, :access_levels, :access_cards, :fireguards, :locations, :location_schedules, :stages, :stage_schedules, :ads, :ad_types], :to => [:manage]
  end

  role :groupleader do
    includes :admin
  end

  role :user do
    includes :guest
    has_permission_on :bands, :to => [:new, :create]
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
    has_permission_on :home, :to => :index
  end

  role :guest do
    has_permission_on :bands, :to => [:new, :create, :show]
    has_permission_on :band_members, :to => [:new, :create, :edit, :update, :destroy]
    has_permission_on :crew_applications, :to => [:new, :create]
    has_permission_on :crew_wishes, :to => [:new, :create]
    has_permission_on :home, :to => :index
    has_permission_on :users, :to => [:new, :create]
    has_permission_on :location_schedules, :to => [:create]
  end
end
privileges do
  privilege :manage do
    includes :new, :create, :show, :index, :list, :edit, :update, :destroy, :choose
  end
end
