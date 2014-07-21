

require_relative 'player'

class Human < Player

	def move( board )
		return false if board.full?

		board.draw
		puts "What is your move?"
		i = STDIN.gets.to_i

		if board.getOpenSpots.include? i
			board.dropPiece(i)
		else
			puts 'Please select an open space on the board.'
			return move( board )
		end

		true
	end

end
