authorization do
  role :admin do
    includes :groupleader
    has_permission_on [:users, :crew_applications, :volunteers], :to => [:manage]
  end

  role :groupleader do
    includes :normal
  end

  role :user do
    includes :guest
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
    has_permission_on :users, :to => [:new, :create]
  end
end
privileges do
  privilege :manage do
    includes :new, :create, :show, :index, :list, :edit, :update, :destroy
  end
end
