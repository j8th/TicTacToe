require 'rules'
require 'board'

describe Rules do
  draw_game_moves = [7, 4, 1, 2, 6, 5, 3, 8, 0]
  x_wins_game_moves = [7, 4, 1, 0, 8, 5, 3]
  o_wins_game_moves = [7, 4, 1, 2, 6, 5, 0, 3]

  describe '#x_wins?' do
    it 'Should return true only if PlayerX won the board.' do
      board = Board.new
      rules = Rules.new
      expect(rules.x_wins?(board)).to eq false

      x_wins_game_moves.each do |i|
        board.drop_piece(i)
        expect(rules.x_wins?(board)).to eq false unless i == x_wins_game_moves.last
        expect(rules.x_wins?(board)).to eq true if i == x_wins_game_moves.last
      end
    end
  end

  describe '#o_wins?' do
    it 'Should return true only if PlayerO won the board.' do
      board = Board.new
      rules = Rules.new
      expect(rules.o_wins?(board)).to eq false

      o_wins_game_moves.each do |i|
        board.drop_piece(i)
        expect(rules.o_wins?(board)).to eq false unless i == o_wins_game_moves.last
        expect(rules.o_wins?(board)).to eq true if i == o_wins_game_moves.last
      end
    end
  end

  describe '#draw_game?' do
  	it 'Should return true only if neither player has won and the board is full.' do
  	  board = Board.new
  	  rules = Rules.new
  	  expect(rules.draw_game?(board)).to eq false

  	  draw_game_moves.each do |i|
  	  	board.drop_piece(i)
  	  	expect(rules.draw_game?(board)).to eq false unless i == draw_game_moves.last
  	  	expect(rules.draw_game?(board)).to eq true if i == draw_game_moves.last
  	  end
    end
  end

  describe '#game_over?' do
  	it 'Should return true if X or O has won, or if the game is a draw.' do
  	  rules = Rules.new

  	  [draw_game_moves, x_wins_game_moves, o_wins_game_moves].each do |moves|
  	    board = Board.new
  	    expect(rules.game_over?(board)).to eq false
  	  	
  	  	moves.each do |i|
  	      board.drop_piece(i)
  	      expect(rules.game_over?(board)).to eq false unless i == moves.last
  	  	  expect(rules.game_over?(board)).to eq true if i == moves.last
  	  	end
  	  end

  	end
  end
end