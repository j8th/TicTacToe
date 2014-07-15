

class Game

	def initialize( playerX, playerO, board )
		@playerX = playerX
		@playerO = playerO
		@board = board

		@playerup = @playerX
	end



	def run
		piece = @playerup == @playerX ? 'X' : 'O'
		puts "#{@playerup.name} (#{piece}) is up."

		@playerup.move @board
		# This blank line makes the game output a bit easier to read.
		puts ""

		if @board.xWins?
			puts "Congratulations to #{@playerX.name} for defeating #{@playerO.name}!"
			puts "Final: "
			@board.draw
		elsif @board.oWins?
			puts "Congratulations to #{@playerO.name} for defeating #{@playerX.name}!"
			puts "Final: "
			@board.draw
		elsif @board.drawGame?
			puts "Game is a draw."
			puts "Final: "
			@board.draw
		else
			@playerup = @playerup == @playerX ? @playerO : @playerX
			run
		end
	end

	def drawGame?
		return @board.drawGame?
	end

	def xWins?
		return @board.xWins?
	end

	def oWins?
		return @board.oWins?
	end

end


