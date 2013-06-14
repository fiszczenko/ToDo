class Ability
	include CanCan::Ability

	def initialize(user)
		can [:read], [List, Task]
		unless user.nil?
			can [:create], [List, Task]
			can [:edit, :destroy, :update], [List, Task] do |a|
				a.user_id == user.id
			end

			can :manage, [User] do |u|
				u.user_id == user.id
			end
		end

	end
end
