# Dargo Wang (yzw0060@auburn.edu)
# COMP3220 - 002 : Programming Languages
# Project_1
class Dog
	attr_reader :breed
	attr_reader :name

	def initialize(breed, color, name, age)
		@breed = breed
		@color = color
		@name = name
		@age = age
	end

	def color
		@color
	end

end

mydog = Dog.new("bulldog", "white", "ruby", 4)
puts mydog.color

class Military_Dog < Dog
end

my_military_dog = Military_Dog.new("shepherd", "black", "winner", 7)

