class Invitation < ActiveRecord::Base
  has_one :recipient, :class_name => 'User'
  
  validates_presence_of :recipient_email
  validate :recipient_is_not_registered
  
  before_create :generate_token
  
  private
  
  def recipient_is_not_registered
    errors.add :recipient_email, 'is already registered' if User.find_by_email(recipient_email)
    errors.add :recipient_email, 'is already waiting for an invitation' if Invitation.find_by_recipient_email(recipient_email)
  end
  
  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
end
