class CrewWish < ActiveRecord::Base
  belongs_to :crew_application
  belongs_to :group
end
