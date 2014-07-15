

$LOAD_PATH << '../lib/'

require 'ai'
require 'board'
require 'game'

describe AI do

	describe '#getRandomMove' do
		it 'Should return a random integer between 0 and 8.' do
			ai = AI.new('Bender')
			board = Board.new

			seen_numbers = []
			for i in 0..10000
				int = ai.send(:getRandomMove, board)
				if not seen_numbers.include? int
					seen_numbers << int
				end
			end
			seen_numbers.sort!
			expect(seen_numbers).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8]
		end
	end

	describe 'Generally speaking' do
		
		# It may not be a great idea to spit out a display like we do here,
		#     but in this particular project it's fine.
		# Might even be a good idea, because we indicate what's going on while we wait...
		#
		# Note that this is not foolproof.
		# It may be possible that two AI's would never defeat each other, but would lose to a human opponent.
		it 'Should never lose.  (With two AI\'s, this means every game should be a draw.)' do
			display = ['|', '/', '-', '\\']
			display_counter = 0
			msg = "   Testing AI Invincibility.  Please wait, this may take some time...  "
			print msg
			bender = AI.new('Bender')
			c3p0 = AI.new('C3P0')

			# I'd say 2,000 games is probably enough...
			for i in 0..2000
				print display[display_counter]
				display_counter = display_counter + 1 > 3 ? 0 : display_counter + 1
				board = Board.new
				game = Game.new(bender, c3p0, board)
				# We don't want to see the output from each of their games...
				devnull = File.new('/dev/null', 'w')
				orig_stdout = $stdout
				$stdout = devnull
				game.run
				expect(game.drawGame).to( eq(true), 
				lambda {
					msg = "Game #{i} was not a draw."
					if game.xWins
						msg += "  #{bender.name} (X) won."
					elsif game.oWins
						msg += "  #{c3p0.name} (O) won."
					else
						msg += "  Something very wrong happened."
					end
					msg += "\n"
					$stdout = StringIO.new
					board.draw
					msg += $stdout.string
					return msg
				})
				# Restore stdout for our progress display (and for the last iteration...)
				$stdout = orig_stdout
				print "\b"
			end
			print " "
			for i in 0..msg.length
				print "\b \b"
			end
		end



		# If we find a game the AI loses, we record the moves here and make sure the AI does not lose it again.
		it 'Should not fail any of these pre-recorded matches against a human.' do
			games_ai_lost = [
				# The AI would still fail both of the below games.
				# However, we have changed its 4th move so that in a 3, 4, 0 situation, it will always take 6.
				#     ( And if you "rotate" the situation, it takes the correct corresponding spot; [0, 4, 1] yields 2, for instance. )
				# Thus, neither of the games below could ever happen.
				#[3, 4, 0, 2, 6, 7, 1], # AI randomly chose 7.  If I choose 1 to block, then I have two ways to get 3 in a row and have won.
				#[3, 4, 0, 2, 6] # AI took 8.  Right now it chooses randomly in this situation, which is not okay.
			]
			bender = AI.new('Bender')
			c3p0 = AI.new('C3P0')

			# Hide game output.
			$stdout = File.new( '/dev/null', 'w' )

			for moves in games_ai_lost
				for i in 0..100
					board = Board.new
					for m in moves
						board.dropPiece m
					end
					game = Game.new(
						bender,
						c3p0,
						board
					)
					game.run
					expect(game.drawGame).to eq true
				end
			end
		end
	end
end