class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? ENV['DEFAULT_GROUP_ROLE']
      can :manage, :all
    end
  end
end
