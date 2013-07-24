class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :password, :password_confirmation
  
  has_many :exercises, dependent: :destroy

  validates_length_of :password, :minimum => 1, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
end
