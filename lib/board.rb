

class Board

  EDGES = [0, 2, 6, 8]
  CORNERS = [1, 3, 5, 7]
  CENTER = 4

  PLAYER_ONE_TOKEN = 'X'
  PLAYER_TWO_TOKEN = 'O'

  def initialize
    @board = [ 0, 1, 2, 3, 4, 5, 6, 7, 8 ]
  end



  def drop_piece(spot)
    if spot_open?(spot)
      p = PLAYER_ONE_TOKEN
      if getXPieces().count > getOPieces().count
        then p = PLAYER_TWO_TOKEN
      end
      @board[spot] = p
      return true
    end
    false
  end

  def spot_open?(spot)
    @board[spot].is_a? Integer
  end

  def getXPieces
    @board.each_index.select{ |i| @board[i] == PLAYER_ONE_TOKEN }
  end

  def getOPieces
    @board.each_index.select{ |i| @board[i] == PLAYER_TWO_TOKEN }
  end

  def get_all_pieces
    @board.each_index.select{ |i| @board[i].is_a? String }
  end


  def get_current_player_pieces
    if getXPieces().count > getOPieces().count
      return getOPieces
    end
    getXPieces
  end

  def get_other_player_pieces
    if getXPieces().count > getOPieces().count
      return getXPieces
    end
    getOPieces
  end

  def get_open_spots
    @board.each_index.select{ |i| @board[i].is_a? Integer}
  end

  def to_array
    @board
  end

  def playerX_is_up?
    getXPieces().count == getOPieces().count
  end

  def playerO_is_up?
    not playerX_is_up?
  end

  def full?
    if get_open_spots().count < 1
      return true
    end
    false
  end

  def empty?
    if get_open_spots().count == 9
      return true
    end
    false
  end

end

