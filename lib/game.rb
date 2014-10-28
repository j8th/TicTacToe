
require_relative 'ui'

class Game

  def initialize(playerX, playerO, board, ui)
    @playerX = playerX
    @playerO = playerO
    @board = board
    @ui = ui

    @playerup = @playerX
  end



  def run
    piece = @playerup == @playerX ? Board::PLAYER_ONE_TOKEN : Board::PLAYER_TWO_TOKEN
    @ui.msg("#{piece} is up.")

    spot = @playerup.get_move(@board, @ui)
    @board.drop_piece(spot)
    # This blank line makes the game output a bit easier to read.
    @ui.msg("")

    if @board.x_wins?
      @ui.msg("X Wins!")
    elsif @board.o_wins?
      @ui.msg("O Wins!")
    elsif @board.draw_game?
      @ui.msg("Game is a draw.")
    else
      @playerup = @playerup == @playerX ? @playerO : @playerX
      run
      return
    end

    @ui.msg("Final: ")
    @ui.draw_board(@board)
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



