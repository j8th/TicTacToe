

class Player
	attr_reader :name

	def initialize( name )
		raise ArgumentError, "name must be a string." unless name.is_a? String

		@name = name
	end



	# Public Methods

	def draw
		UI.msg("Name: #{@name}")
	end



	# "Interface" Methods

	# The player makes a move on the board.
	# This method drops a piece on the board (the board object is actually changed).
	def move( board )
		raise NotImplementedError, "Implement this method in a child class."
	end

end
