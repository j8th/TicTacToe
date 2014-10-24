

require 'board'

describe Board do
  drawGameMoves = [7, 4, 1, 2, 6, 5, 3, 8, 0]
  xWinsGameMoves = [7, 4, 1, 0, 8, 5, 3]
  oWinsGameMoves = [7, 4, 1, 2, 6, 5, 0, 3]

  describe '#dropPiece' do
    it "Should alternate pieces appropriately.  X, then O, then X, etc." do
      board = Board.new
      for i in drawGameMoves
        board.dropPiece i
        xs = board.getXPieces
        os = board.getOPieces
        expect(xs.count).to be >= os.count
      end
    end
    it "Should start with X's" do
      board = Board.new
      board.dropPiece(4)
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
      board.dropPiece(4)
      expect(board.empty?).to eq(false)
    end
  end

  describe '#full' do
    it "Should return true only for a full board." do
      board = Board.new
      expect(board.full?).to eq(false)

      for i in drawGameMoves
        board.dropPiece i
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
      board.dropPiece(7)
      expect(board.playerX_is_up?).to eq false
      board.dropPiece(4)
      expect(board.playerX_is_up?).to eq true
    end
  end

  describe '#playerO_is_up?' do
    it 'Should return true if it is PlayerO\'s turn and false otherwise.' do
      board = Board.new
      expect(board.playerO_is_up?).to eq false
      board.dropPiece(7)
      expect(board.playerO_is_up?).to eq true
      board.dropPiece(4)
      expect(board.playerO_is_up?).to eq false
    end
  end

  describe '#xWins' do
    it 'Should return true only if PlayerX won the board.' do
      board = Board.new
      expect(board.xWins?).to eq false

      xWinsGameMoves.each do |i|
        board.dropPiece(i)
        expect(board.xWins?).to eq false unless i == xWinsGameMoves.last
        expect(board.xWins?).to eq true if i == xWinsGameMoves.last
      end
    end
  end

  describe '#oWins' do
    it 'Should return true only if PlayerO won the board.' do
      board = Board.new
      expect(board.oWins?).to eq false

      oWinsGameMoves.each do |i|
        board.dropPiece(i)
        expect(board.oWins?).to eq false unless i == oWinsGameMoves.last
        expect(board.oWins?).to eq true if i == oWinsGameMoves.last
      end
    end
  end

  describe '#getAllPieces' do
    it 'Should return all the X\'s and O\'s on the board and ONLY the X\'s and O\'s' do
      board = Board.new
      for i in 0..4
        board.dropPiece i
      end
      pieces = board.getAllPieces
      pieces.sort!
      expect(pieces).to eq [0, 1, 2, 3, 4]
    end

    it 'Should return an empty array when there are no pieces on the board.' do
      board = Board.new
      expect(board.getAllPieces).to eq []
    end
  end

  describe '#getCurrentPlayerPieces' do
    it 'Should return all the pieces for the player who is up.' do
      board = Board.new
      for i in [7, 0, 5, 2]
        board.dropPiece i
      end
      xs = board.getCurrentPlayerPieces
      expect(xs.sort!).to eq [5, 7]
      
      board.dropPiece 4
      os = board.getCurrentPlayerPieces
      expect(os.sort!).to eq [0, 2]
    end
  end

  describe '#getOtherPlayerPieces' do
    it 'Should return all the pieces for the player who is not up.' do
            board = Board.new
      for i in [7, 0, 5, 2]
        board.dropPiece i
      end

      os = board.getOtherPlayerPieces
      expect(os.sort!).to eq [0, 2]
      
      board.dropPiece 4
      xs = board.getOtherPlayerPieces
      expect(xs.sort!).to eq [4, 5, 7]
    end
  end

end
