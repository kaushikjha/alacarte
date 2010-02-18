class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
    
    if !user.new_record?
      can :manage, :all
    else
      
    end
  end  
end