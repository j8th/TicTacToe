class Rules

  WINNING_SCORE = 12



  def x_wins?(board)
    win(board.getXPieces)
  end

  def o_wins?(board)
    win(board.getOPieces)
  end

  def draw_game?(board)
    if not x_wins?(board) and not o_wins?(board) and board.full?
      return true
    end
    false
  end

  def game_over?(board)
    if x_wins?(board) or o_wins?(board) or draw_game?(board)
      return true
    end
    false
  end



  private
  def win(pieces)
    return false if pieces.length < 3

    # We search for any 3 integers that total to 12 in an array of arbitrary length.
    # This approach might be a bit extreme, but it should always work.
    # 
    # This would be "n(scary) but fast enough in practice" as they say,
    #   since our array will always be short.
    for a in 0..pieces.length-3
      for b in a+1..pieces.length-2
        for c in b+1..pieces.length-1
          if(pieces[a] + pieces[b] + pieces[c] == WINNING_SCORE)
            return true;
          end
        end
      end
    end

    false
  end

end