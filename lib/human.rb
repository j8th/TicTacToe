

require_relative 'player'

class Human < Player

  def move(board)
    return false if board.full?

    board.draw
    choice = UI.prompt("What is your move?", board.get_open_spots)
    board.drop_piece(choice)
  end

end
