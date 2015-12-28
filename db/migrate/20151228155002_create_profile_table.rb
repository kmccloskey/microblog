class CreateProfileTable < ActiveRecord::Migration
	def change
		create_table :profiles do |t|
			t.string :bio
			t.string :age
			t.string :location
		end
	end
end
