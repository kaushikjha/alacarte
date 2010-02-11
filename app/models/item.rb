class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :prices, :dependent => :destroy
  accepts_nested_attributes_for :prices
end
