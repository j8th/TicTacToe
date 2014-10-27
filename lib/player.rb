

class Player
  attr_reader :name

  def initialize(name)
    raise ArgumentError, "name must be a string." unless name.is_a? String

    @name = name
  end



  # Public Methods
  # None at present.


  # "Interface" Methods

  # Get the move for the player for the given board.
  # Should return an integer indicating where the player chose to move.
  # Should return nil if the board is a game that is over (either player has won, or the game is a draw).
  def get_move(board, ui)
    raise NotImplementedError, "Implement this method in a child class."
  end

end
