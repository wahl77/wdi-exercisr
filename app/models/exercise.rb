class Exercise < ActiveRecord::Base
  belongs_to :user
  attr_accessible :activity, :units, :value, :date
end
