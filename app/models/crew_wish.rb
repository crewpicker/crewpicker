# encoding: UTF-8
class CrewWish < ApplicationRecord
  belongs_to :crew_application
  belongs_to :group
end
