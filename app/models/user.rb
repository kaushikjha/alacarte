class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :menus
  has_many :categories
  has_many :items
  has_many :prices
  
  belongs_to :invitation
  
  validates_uniqueness_of :email
  validates_presence_of :invitation_id, :message => 'is required'
  validates_uniqueness_of :invitation_id
  
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
