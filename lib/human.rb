

require_relative 'player'

class Human < Player

  def get_move(board, ui)
    return nil if board.game_over?

    ui.draw_board(board)
    choice = ui.prompt("What is your move?", board.get_open_spots)
  end

end
