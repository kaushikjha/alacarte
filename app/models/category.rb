class Category < ActiveRecord::Base
  belongs_to :user
  belongs_to :menu
  has_many :items, :dependent => :destroy
end
