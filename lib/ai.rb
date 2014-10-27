

require_relative 'player'

class AI < Player

  def move(board, ui)
    return false if board.full?

    ui.msg("Thinking...")
    minimax(board)

    board.drop_piece @choice
  end



  private
  def minimax(board)
    return 1 if board.x_wins?
    return -1 if board.o_wins?
    return 0 if board.draw_game?

    scores = {}

    board.get_open_spots.each do |spot|
      board_copy = Marshal.load(Marshal.dump(board))
      board_copy.drop_piece(spot)
      scores[spot] = minimax(board_copy)
    end

    if board.playerX_is_up?
      max = scores.max_by{|k,v| v}
      @choice = max[0]
      return max[1]
    else
      min = scores.min_by{|k,v| v}
      @choice = min[0]
      return min[1]
    end
  end

end