# encoding: UTF-8
class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :role
end
