class Category < ActiveRecord::Base
  acts_as_list :scope => :menu
  belongs_to :user
  belongs_to :menu
  has_many :items, :dependent => :destroy
  
  validates_presence_of :name
end
