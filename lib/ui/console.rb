class Console
  # Display a text message to the user.
  def msg(string)
    puts string
  end

  # Display a text message to the user
  def prompt(instruction_message, choices)
    puts instruction_message
    input = STDIN.gets.chomp
    return input if choices.include? input
    return input.to_i if choices.include? input.to_i
    return input.downcase if choices.include? input.downcase
    return input.upcase if choices.include? input.upcase
    puts 'That is not a valid option.'
    return prompt(instruction_message, choices)
  end

  def draw_board(board)
    spots = board.to_array
    string = <<-EOS
The Board:
#{spots[7]} #{spots[0]} #{spots[5]}
#{spots[2]} #{spots[4]} #{spots[6]}
#{spots[3]} #{spots[8]} #{spots[1]}
EOS
    msg(string)
  end
end