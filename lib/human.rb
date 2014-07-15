

require_relative 'player'

class Human < Player

	def move( board )
		return false if board.full?

		board.draw
		puts "What is your move?"
		i = STDIN.gets.to_i
		
		unless i.between?(0, 8)
			puts 'Please enter an integer between 0 and 8.'
			move(board)
		end

		unless board.dropPiece(i)
			puts 'That space is already taken.  Please select another.'
			move(board)
		end

		return true
	end

end
