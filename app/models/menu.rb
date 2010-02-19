class Menu < ActiveRecord::Base
  acts_as_list :scope => :user
  belongs_to :user
  has_many :categories, :dependent => :destroy
  
  validates_uniqueness_of :name, :scope => [:user_id], :message => 'You already have a menu with that name.'
end
