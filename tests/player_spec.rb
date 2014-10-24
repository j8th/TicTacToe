

require 'player'

describe Player do

  describe '#name' do
    it "returns the Player's name" do
      player = Player.new( "The Dude" )
      expect(player.name).to eq("The Dude")
    end
  end

end