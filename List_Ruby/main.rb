# Dargo Wang (yzw0060@auburn.edu)
# COMP3220 - 002 : Programming Languages
# Project_1

require_relative 'search_controller.rb' 

# Initialize default list ...
defaultSearchList = ["toy story", 
						"spider man", 
						"star wars", 
						"harry potter", 
						"the hobbit", 
						"the hangover"]

# Let first search_controller get default list
controllerObject = SearchController.new(defaultSearchList)
puts "seach_list: #{controllerObject.showList()}"

##### 
#
# 1.create endless loop 
# 2.get an input from terminal(console)
# 3.update search suggestion list
# 4.loop should end when user write "exit"
# 5.save updated "searchSuggestionList" to "data.txt" file
#
#####
#<TODO: write your code here>

while true do
    newMovie = gets.chop
    if newMovie == "exit"
        break
    end
    controllerObject.updateList(newMovie)
end
controllerObject.saveListToFile()

    
    
    
    
