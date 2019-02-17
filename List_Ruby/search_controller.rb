# Dargo Wang (yzw0060@auburn.edu)
# COMP3220 - 002 : Programming Languages
# Project_1

# Search controller class
class SearchController

	attr_accessor :searchSuggestionList

	def initialize(search_list = [])
		@search_list = search_list
  	end

	def showList()
		@search_list
	end

	def updateList(movie_name)
		new_list = [movie_name]
        @search_list.each do |movie|
            if movie.upcase != movie_name.upcase
                new_list.push(movie)
            end
        end
        @search_list = new_list
	end

	def saveListToFile()
		##### 
		#
		# 1.save updated search suggestion list to "data.txt" file 
		#
		#####
		#<TODO: write your code here>
        newFile = File.new("data.txt", "w+")
        if newFile
            newFile.puts(@search_list)
        end
	end

end


