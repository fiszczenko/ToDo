class Ability
	include CanCan::Ability

	def initialize(user)
		can [:read], [List, Task]
		unless user.nil?
			can [:create], [List, Task]
			can [:edit, :destroy, :update], [List] do |l|
				l.user_id == user.id
			end

			can [:edit, :destroy, :update, :done], [Task] do |t|
				t.user_id == user.id
			end

			can :manage, [User] do |u|
				u.user_id == user.id
			end
		end

	end
end
