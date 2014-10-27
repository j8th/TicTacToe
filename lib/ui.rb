class UI
  # "Interface" method.
  # Display a text message to the user.
  def msg(string)
    raise NotImplementedError, "Implement this method in a child class."
  end

  # "Interface" method.
  # Display a text message to the user
  def prompt(instruction_message, choices)
    raise NotImplementedError, "Implement this method in a child class."
  end

  # "Interface" method.
  # Draw the board.
  def draw_board(board)
    raise NotImplementedError, "Implement this method in a child class."
  end
end