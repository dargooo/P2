# Dargo Wang (yzw0060@auburn.edu)
# COMP3220 - 002 : Programming Languages
# Project_1
class Animal
	def initialize (age, num_feet, color, name)
		@age = age
		@num_feet = num_feet
		@color = color
		@name = name
	end

	def change_name (newName)
		@name = newName
	end

	def change_age (new_age)
		@age = new_age
	end

	def num_feet
		@num_feet
	end
end

rabbit = Animal.new(3, 4, "white", "snow")

