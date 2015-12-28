class User <ActiveRecord::Base
	has_one :profile
	has_many :posts
	# Adds user to relationship table when they follow another user.
	has_many :relationships, foreign_key: :follower_id
	has_many :followed, through: :relationships, source: :followed
	# Adds user to relationship table when they are followed by a user.
	has_many :reverse_relationships, foreign_key: :followed_id, class_name: 'Relationship'
	has_many :followers, through: :reverse_relationships, source: :follower

	# Method to allow user to follow another user.
	def follow!(user)
		followed << user
	end
end

class Relationship <ActiveRecord::Base
	belongs_to :followed, class_name: 'User'
	belongs_to :follower, class_name: 'User'
end

class Profile <ActiveRecord::Base
	belongs_to :users
end

class Post <ActiveRecord::Base
	belongs_to :users
end