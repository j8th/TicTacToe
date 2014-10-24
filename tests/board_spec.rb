

require 'board'

describe Board do
  draw_game_moves = [7, 4, 1, 2, 6, 5, 3, 8, 0]
  x_wins_game_moves = [7, 4, 1, 0, 8, 5, 3]
  o_wins_game_moves = [7, 4, 1, 2, 6, 5, 0, 3]

  describe '#drop_piece' do
    it "Should alternate pieces appropriately.  X, then O, then X, etc." do
      board = Board.new
      for i in draw_game_moves
        board.drop_piece i
        xs = board.getXPieces
        os = board.getOPieces
        expect(xs.count).to be >= os.count
      end
    end
    it "Should start with X's" do
      board = Board.new
      board.drop_piece(4)
      xs = board.getXPieces
      os = board.getOPieces
      expect(xs.count).to eq 1
      expect(os.count).to eq 0
    end
  end

  describe '#empty' do
    it "Should return true for a new board." do
      board = Board.new
      expect(board.empty?).to eq(true)
    end
    it "Should return false after a piece has been dropped." do
      board = Board.new
      board.drop_piece(4)
      expect(board.empty?).to eq(false)
    end
  end

  describe '#full' do
    it "Should return true only for a full board." do
      board = Board.new
      expect(board.full?).to eq(false)

      for i in draw_game_moves
        board.drop_piece i
        if(i == 0)
          expect(board.full?).to eq(true)
        else
          expect(board.full?).to eq(false)
        end
      end
    end
  end

  # TODO:  What should this method and the next return if the game is over?
  #   (A player has won or it is a draw game)  False?
  describe '#playerX_is_up?' do
    it 'Should return true if it is PlayerX\'s turn and false otherwise.' do
      board = Board.new
      expect(board.playerX_is_up?).to eq true
      board.drop_piece(7)
      expect(board.playerX_is_up?).to eq false
      board.drop_piece(4)
      expect(board.playerX_is_up?).to eq true
    end
  end

  describe '#playerO_is_up?' do
    it 'Should return true if it is PlayerO\'s turn and false otherwise.' do
      board = Board.new
      expect(board.playerO_is_up?).to eq false
      board.drop_piece(7)
      expect(board.playerO_is_up?).to eq true
      board.drop_piece(4)
      expect(board.playerO_is_up?).to eq false
    end
  end

  describe '#x_wins' do
    it 'Should return true only if PlayerX won the board.' do
      board = Board.new
      expect(board.x_wins?).to eq false

      x_wins_game_moves.each do |i|
        board.drop_piece(i)
        expect(board.x_wins?).to eq false unless i == x_wins_game_moves.last
        expect(board.x_wins?).to eq true if i == x_wins_game_moves.last
      end
    end
  end

  describe '#o_wins' do
    it 'Should return true only if PlayerO won the board.' do
      board = Board.new
      expect(board.o_wins?).to eq false

      o_wins_game_moves.each do |i|
        board.drop_piece(i)
        expect(board.o_wins?).to eq false unless i == o_wins_game_moves.last
        expect(board.o_wins?).to eq true if i == o_wins_game_moves.last
      end
    end
  end

  describe '#get_all_pieces' do
    it 'Should return all the X\'s and O\'s on the board and ONLY the X\'s and O\'s' do
      board = Board.new
      for i in 0..4
        board.drop_piece i
      end
      pieces = board.get_all_pieces
      pieces.sort!
      expect(pieces).to eq [0, 1, 2, 3, 4]
    end

    it 'Should return an empty array when there are no pieces on the board.' do
      board = Board.new
      expect(board.get_all_pieces).to eq []
    end
  end

  describe '#get_current_player_pieces' do
    it 'Should return all the pieces for the player who is up.' do
      board = Board.new
      for i in [7, 0, 5, 2]
        board.drop_piece i
      end
      xs = board.get_current_player_pieces
      expect(xs.sort!).to eq [5, 7]
      
      board.drop_piece 4
      os = board.get_current_player_pieces
      expect(os.sort!).to eq [0, 2]
    end
  end

  describe '#get_other_player_pieces' do
    it 'Should return all the pieces for the player who is not up.' do
            board = Board.new
      for i in [7, 0, 5, 2]
        board.drop_piece i
      end

      os = board.get_other_player_pieces
      expect(os.sort!).to eq [0, 2]
      
      board.drop_piece 4
      xs = board.get_other_player_pieces
      expect(xs.sort!).to eq [4, 5, 7]
    end
  end

end
