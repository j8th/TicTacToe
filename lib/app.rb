

class App
  def initialize
    UI.msg("Welcome to Tic Tac Toe!")
    choice = UI.prompt(
      "Who is human, #{Board::PLAYER_ONE_TOKEN} or #{Board::PLAYER_TWO_TOKEN}?",
      [Board::PLAYER_ONE_TOKEN, Board::PLAYER_TWO_TOKEN]
   )
    @human_is_X = choice == Board::PLAYER_ONE_TOKEN ? true : false
  end

  def run
    UI.msg("")
    
    playerX, playerO = create_players()

    game = Game.new(
      playerX,
      playerO,
      Board.new
   )
    game.run

    choice = UI.prompt("Would you like to play again?  (y/n)", ['y', 'n'])
    run() if choice == 'y'
  end

  private
  def create_players
    human = Human.new('Fry')
    computer = AI.new('Bender')
    if @human_is_X
      playerX = human
      playerO = computer
    else
      playerX = computer
      playerO = human
    end
    [playerX, playerO]
  end
end
