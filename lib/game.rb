class Game
  attr_reader :players

  def initialize
    @players = []    
  end
	
  def score
		0
	end

  def add_player player
    @players << player
  end
end