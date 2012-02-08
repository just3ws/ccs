class Ability
  include CanCan::Ability

  def initialize(user)
    # NOTE: avoid using blocks to define accessibility
    # as they are not compatible with the automatic loading
    # of index resources.
    # https://github.com/ryanb/cancan/wiki/Authorizing-Controller-Actions

    user ||= User.new :role => "guest" # guest user (not logged in)

    if user.role? :guest
      can :create, Comment
      can :create, Preregistration
      can :create, Submission
      can :read, Submission
      can :read, Content
      can :read, Post
      can :read, Room
      can :read, Schedule
      can :read, Sesja
      can :read, Sponsor
      can :read, SponsorshipLevel
      can :read, TimeSlot
      can :read, User do |u|
        (u.sesja.present? && u.sesja.displayable.present?)
      end
    end

    if user.role? :attendee
    end

    if user.role? :speaker
      can :manage, Submission, :user_id => user.id
      can :manage, User, { :id => user.id }
      can :update, Sesja, { :user_id => user.id }
    end

    if user.role? :admin
      can :manage, :all
    end

    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
