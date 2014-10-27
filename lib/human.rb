

require_relative 'player'

class Human < Player

  def move(board, ui)
    return false if board.full?

    ui.draw_board(board)
    choice = ui.prompt("What is your move?", board.get_open_spots)
    board.drop_piece(choice)
  end

end
