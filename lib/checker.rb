require_relative './game'

class Checker
  attr_reader :columns_num, :rows_num
  attr_accessor :grid, :game, :x, :board

  def initialize columns_num = nil, rows_num = nil
    @columns_num = 7
    @rows_num = 6
    @game = Game.new
    @initial_mark = ("\u2610".encode('utf-8'))
    # Grid is an array of @columns_num elements so
    # that when calling create_grid i don't have a 2
    # dimensional array which does not let me change
    # an element without affecting the rest.
    @grid = [@initial_mark] * @columns_num
    @x = 0
    @board = []
  end

  def drop_at_column y
    check_spot y
    puts @x
    if @board[@x][y] == @initial_mark
      if @game.turn.odd?
        @board[@x][y] = "\u2689".encode('utf-8')
      else
        @board[@x][y] = "\u2687".encode('utf-8')
      end
      win? y
    else
      puts "That column is already full."
      new_drop
    end
    @game.increase_turn
    board_display
    new_drop
  end

  def new_drop
    puts "What column do you want your checker to drop at?"
    new_y = gets.chomp
    drop_at_column(new_y.to_i-1) # Indexing at 1 not 0
  end

  def check_spot y
    (0..@rows_num-1).step do |i|
      return @x = i if @board[i][y] == @initial_mark
    end
  end

  def win? y
    if @board[@x][y] == @board[@x-1][y]
      if @board[@x][y] == @board[@x-2][y]
        if @board[@x][y] == @board[@x-3][y]
          if @board[@x][y] == @board[@x-4][y]
            puts "WIN!!"
            exit
          end
        end
      end
    end
  end

  def create_grid rows = 6, cols = 7
    puts "Welcome to the ConnectFour Game!"
    (1..rows).step do |i|
      p @grid[i] = Array.new(cols, "\u2610".encode('utf-8'))
      @board << @grid[i]
    end
  end

  def board_display
    # Reversing so that array is indexed from bottom
    @board.reverse.each do |element|
      p element
    end
  end
end

game = Game.new
checker = Checker.new
game.add_player "Alex"
game.add_player "Bob"
checker.create_grid
checker.new_drop