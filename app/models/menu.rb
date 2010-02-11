class Menu < ActiveRecord::Base
  belongs_to :user
  has_many :categories
  
  validates_uniqueness_of :name, :scope => [:user_id], :message => 'You already have a menu with that name.'
end
