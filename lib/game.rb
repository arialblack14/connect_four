class Game
  attr_reader :players, :score, :turn

  def initialize
    @players = []
    @score = []
    @turn = 0
  end
	
  def add_player player
    @players << player unless @players.size == 2
  end

  def increase_turn
    @turn += 1
    puts "Next player's turn to play."
  end

  def color player
    player == @players[0] ? "black" : "white"
  end
end