class Price < ActiveRecord::Base
  validates_presence_of :price
  belongs_to :user
  
  def price=(price)
    price.gsub!(/[^0-9|.]/, '')
    self[:price] = price
  end
end
