

require_relative 'player'

class AI < Player

	def move( board )
    	return false if board.full?

		if spot = getWinningMove(board)
			puts "WinningMove" if $DEBUG
		elsif spot = getBlockingMove(board)
			puts "BlockingMove" if $DEBUG
		elsif spot = getGoodMove(board)
			puts "GoodMove" if $DEBUG
		else
			spot = getRandomMove(board)
			puts "RandomMove" if $DEBUG
		end

		board.dropPiece spot
		true
	end



	private
	def getWinningMove( board )
		searchLine board, board.getCurrentPlayerPieces
	end

	def getBlockingMove( board )
		searchLine board, board.getOtherPlayerPieces
	end

	def searchLine( board, pieces )
		open = board.getOpenSpots

		# We can't have a winning move without at least 1 open spot and 2 pieces.
		return nil if( pieces.length < 2 || open.length < 1 )

		for a in 0..pieces.length-2
			for b in a+1..pieces.length-1
				for c in 0..open.length-1
					if pieces[a] + pieces[b] + open[c] == Board::WINNING_SCORE
						return open[c]
					end
				end
			end
		end
		nil
	end

	def getGoodMove( board )
		case board.getAllPieces().count
		when 0
			return 7
		when 1
			[4, 7].each do |i|
				return i if board.spotOpen?(i)
			end
		when 2
			[7, 4, 1].each do |i|
				return i if board.spotOpen?(i)
			end
		when 3
			return getFourthMove( board )
		end

		nil
	end

	# On the fourth move of the game, we know we are O's.
	def getFourthMove( board )
		xs = board.getXPieces
		openSpots = board.getOpenSpots

		if xs.include? Board::CENTER # There is an X in the center.
			openCorners = openSpots - Board::EDGES
			return openCorners[0]
		elsif (xs - Board::EDGES).empty? # Both X's are in edge spots.
			safeSpots = openSpots - Board::EDGES
			safeSpots.delete( (xs[0] + xs[1]) / 2 )
			return safeSpots[0]
		elsif (xs - Board::CORNERS).empty? # Both X's are in corners.
			openEdges = openSpots - Board::CORNERS
			return openEdges[0]
		else # One X in a corner and one X in an edge.
			cornerX = (xs - Board::EDGES)[0]
			edgeX   = (xs - Board::CORNERS)[0]
			return (cornerX * 2) - edgeX
		end

	end

	def getRandomMove( board )
		return nil if board.full?

		i = 0 + rand(9)
		if board.spotOpen?(i)
			return i
		else
			return getRandomMove(board)
		end
	end

end
