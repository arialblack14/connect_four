class Game
  attr_reader :players, :score, :turn

  def initialize
    @players = []
    @score = []
    @turn = 1
  end
	
  def add_player player
    @players << player unless @players.size == 2
  end

  def increase_turn
    @turn.odd? ? (puts "First player's turn") : (puts "2nd player's turn.")
    @turn += 1
  end

  def color player
    player == @players[0] ? "black" : "white"
  end
end