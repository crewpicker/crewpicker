# encoding: UTF-8
class Role < ActiveRecord::Base
  belongs_to :user
end
