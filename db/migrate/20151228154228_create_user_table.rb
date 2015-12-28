class CreateUserTable < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :username
			t.string :password
			t.string :fname
			t.string :lname
			t.string :email
		end
	end
end
