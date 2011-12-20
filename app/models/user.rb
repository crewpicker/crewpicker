class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :password, :password_confirmation, :authentications_attributes
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :authentications, :dependent => :destroy
  has_many :roles
  has_one :crew_application
  accepts_nested_attributes_for :authentications

  validates_length_of :password, :minimum => 5, :if => :password
  validates_confirmation_of :password, :if => :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_uniqueness_of :username
  def role_symbols
    (roles || []).map {|r| r.title.to_sym}
  end
end
