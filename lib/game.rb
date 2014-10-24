
require_relative 'ui'

class Game

  def initialize(playerX, playerO, board)
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

    if @board.x_wins?
      UI.msg("Congratulations to #{@playerX.name} for defeating #{@playerO.name}!")
    elsif @board.o_wins?
      UI.msg("Congratulations to #{@playerO.name} for defeating #{@playerX.name}!")
    elsif @board.draw_game?
      UI.msg("Game is a draw.")
    else
      @playerup = @playerup == @playerX ? @playerO : @playerX
      run
      return
    end

    UI.msg("Final: ")
    @board.draw
  end

  def draw_game?
    @board.draw_game?
  end

  def x_wins?
    @board.x_wins?
  end

  def o_wins?
    @board.o_wins?
  end

end



