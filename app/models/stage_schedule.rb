class StageSchedule < ActiveRecord::Base
  belongs_to :stage
  belongs_to :band
end
