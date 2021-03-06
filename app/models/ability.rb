class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
    
    if !user.new_record?
      can :index, :all
      can :create, :all
      can [:show, :update, :destroy, :position, :print], Menu do |menu|
        menu.try(:user) == user
      end
      can [:show, :update, :destroy, :position], Category do |category|
        category.try(:user) == user
      end
      can [:show, :update, :destroy, :position], Item do |item|
        item.category.try(:user) == user
      end
    else
      can :manage, :all
    end
  end  
end