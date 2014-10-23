
require_relative 'ui'

class Game

	def initialize( playerX, playerO, board )
		@playerX = playerX
		@playerO = playerO
		@board = board

		@playerup = @playerX
	end



	def run
		piece = @playerup == @playerX ? Board::PLAYER_ONE_TOKEN : Board::PLAYER_TWO_TOKEN
		UI.msg("#{@playerup.name} (#{piece}) is up.")

		@playerup.move @board
		# This blank line makes the game output a bit easier to read.
		UI.msg("")

		if @board.xWins?
			UI.msg("Congratulations to #{@playerX.name} for defeating #{@playerO.name}!")
		elsif @board.oWins?
			UI.msg("Congratulations to #{@playerO.name} for defeating #{@playerX.name}!")
		elsif @board.drawGame?
			UI.msg("Game is a draw.")
		else
			@playerup = @playerup == @playerX ? @playerO : @playerX
			run
			return
		end

		UI.msg("Final: ")
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



