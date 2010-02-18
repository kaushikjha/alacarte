class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :menus
  has_many :categories
  has_many :items
  has_many :prices
end
