class Price < ActiveRecord::Base
  validates_presence_of :price
  belongs_to :user
end
