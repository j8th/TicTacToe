

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
		elsif @board.oWins?
			puts "Congratulations to #{@playerO.name} for defeating #{@playerX.name}!"
		elsif @board.drawGame?
			puts "Game is a draw."
		else
			@playerup = @playerup == @playerX ? @playerO : @playerX
			run
			return
		end

		puts "Final: "
		@board.draw
	end

	def drawGame?
		@board.drawGame?
	end

	def xWins?
		@board.xWins?
	end

	def oWins?
		@board.oWins?
	end

end



