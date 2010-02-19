class Item < ActiveRecord::Base
  acts_as_list :scope => :category
  belongs_to :user
  belongs_to :category
  has_many :prices, :dependent => :destroy
  accepts_nested_attributes_for :prices, :reject_if => lambda { |a| a[:price].blank? }, :allow_destroy => true
  
  validates_presence_of :name
  
  def validate
    errors.add_to_base("Must have at least one price") unless prices.length > 0
  end
end
