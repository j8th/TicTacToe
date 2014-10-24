

require_relative 'player'

class AI < Player

  def move( board )
    return false if board.full?

    UI.msg("Thinking...")
    minimax( board )

    board.dropPiece @choice
  end



  private
  def minimax( board )
    return 1 if board.xWins?
    return -1 if board.oWins?
    return 0 if board.drawGame?

    scores = {}

    board.getOpenSpots.each do |spot|
      board_copy = Marshal.load( Marshal.dump(board) )
      board_copy.dropPiece(spot)
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