require_relative './game'

class Checker
  attr_reader :columns_num, :rows_num
  attr_accessor :grid, :game

  def initialize columns_num = nil, rows_num = nil
    @columns_num = 7
    @rows_num = 6
    @game = Game.new
    @grid = create_grid @columns_num, @rows_num
  end

  def drop_at_column(x,y,player)
    if @grid[x][y] == 0
      if @game.turn.odd?
        @grid[x][y] = "\u2689".encode('utf-8')
      elsif @game.turn.even?
        @grid[x][y] = "\u2687".encode('utf-8')
      else
        puts "Error."
      end
      grid_display @grid
      @game.increase_turn
      new_drop player.next
    else
      puts "Invalid move!"
      new_drop player
    end
    grid_display @grid
  end

  def new_drop player
    puts "Please provide x coordinate."
    new_x = gets.chomp.to_i
    puts "Now y please."
    new_y = gets.chomp.to_i
    drop_at_column(new_x, new_y, player)
  end

  def create_grid cols, rows
    puts "Welcome to the ConnectFour Game!"
    @grid = Array.new(@rows_num, Array.new(@columns_num, 0))
    grid_display @grid
  end

  def grid_display grid
    grid.each do |element|
      p element
    end    
  end
end

game = Game.new
checker = Checker.new
game.add_player "Alex"
game.add_player "Bob"

checker.drop_at_column(5,1, "Alex")
checker.drop_at_column(5,2, "Bob")