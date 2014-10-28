class AI

  def get_move(board, rules, ui)
    return nil if rules.game_over?(board)

    ui.msg("Thinking...")
    minimax(board, rules)

    @choice
  end



  private
  def minimax(board, rules)
    return 1 if rules.x_wins?(board)
    return -1 if rules.o_wins?(board)
    return 0 if rules.draw_game?(board)

    scores = {}

    board.get_open_spots.each do |spot|
      board_copy = Marshal.load(Marshal.dump(board))
      board_copy.drop_piece(spot)
      scores[spot] = minimax(board_copy, rules)
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