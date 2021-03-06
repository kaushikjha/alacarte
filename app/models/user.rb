class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :menus, :dependent => :destroy
  has_many :categories, :dependent => :destroy
  has_many :items, :dependent => :destroy
  has_many :prices, :dependent => :destroy
  
  belongs_to :invitation, :dependent => :destroy
  
  validates_uniqueness_of :email
  validates_presence_of :invitation_id, :message => 'is required'
  validates_uniqueness_of :invitation_id
  validates_presence_of :restaurant_name
  
  def invitation_token
    invitation.token if invitation
  end
  def invitation_token=(token)
    self.invitation = Invitation.find_by_token(token)
  end
  
  def self.reset_all_hits
    User.update_all("hits = 0", "hits > 0")
  end
end
