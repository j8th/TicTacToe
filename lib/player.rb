

class Player
	attr_reader :name

	def initialize( name )
		raise ArgumentError, "name must be a string." unless name.is_a? String

		@name = name
	end



	# Public Methods

	def draw
		puts "Name: #{@name}"
	end



	# "Interface" Methods

	# The player makes a move on the board.
	# This method drops a piece on the board (the board object is actually changed).
	# 
	# Returns true if the player successfully makes a move on the board.
	# Returns false otherwise.  (This could happen, and should only happen, if the board is full.)
	def move( board )
		raise NotImplementedError, "Implement this method in a child class."
	end

end
