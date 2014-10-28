class Game

  def initialize(playerX, playerO, board, rules, ui)
    @playerX = playerX
    @playerO = playerO
    @board = board
    @rules = rules
    @ui = ui

    @playerup = @playerX
  end



  def run
    piece = @playerup == @playerX ? Board::PLAYER_ONE_TOKEN : Board::PLAYER_TWO_TOKEN
    @ui.msg("#{piece} is up.")

    spot = @playerup.get_move(@board, @rules, @ui)
    @board.drop_piece(spot)
    # This blank line makes the game output a bit easier to read.
    @ui.msg("")

    if @rules.x_wins?(@board)
      @ui.msg("X Wins!")
    elsif @rules.o_wins?(@board)
      @ui.msg("O Wins!")
    elsif @rules.draw_game?(@board)
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
    @rules.draw_game?(@board)
  end

  def x_wins?
    @rules.x_wins?(@board)
  end

  def o_wins?
    @rules.o_wins?(@board)
  end

end



