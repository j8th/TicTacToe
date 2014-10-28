class Human

  def get_move(board, rules, ui)
    return nil if rules.game_over?(board)

    ui.draw_board(board)
    choice = ui.prompt("What is your move?", board.get_open_spots)
  end

end
