# encoding: UTF-8
class UserRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
end
