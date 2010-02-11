class Category < ActiveRecord::Base
  belongs_to :user
  belongs_to :menu
  has_many :items, :dependent => :destroy
  
  validates_presence_of :name
end
