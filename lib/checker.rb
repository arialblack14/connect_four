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
    if @board[@x][y] == @initial_mark
      if @game.turn.odd?
        @board[@x][y] = "\u2689".encode('utf-8')
      else
        @board[@x][y] = "\u2687".encode('utf-8')
      end
    else
      puts "Invalid choice."
      new_drop
    end
    win? y
    @game.increase_turn
    board_display
    new_drop
  end

  def new_drop
    puts "What column do you want your checker to drop at?"
    new_y = gets.chomp
    drop_at_column(new_y.to_i-1) # Indexing at 1 not 0
  end

  # This is to only change @x if no other checkers have 
  # been dropped at that position.
  def check_spot y
    (0..@rows_num-1).step do |i|
      return @x = i if @board[i][y] == @initial_mark
    end
  end

  def win? y
    # y = y + 1
    # (1..@rows_num).step do |i|
    #   if @board[@x][y] != @initial_mark
    #     if ((@board[@x][y] == @board[@x+1][y] && @board[@x][y] == @board[@x+2][y] && @board[@x][y] == @board[@x+3][y] && !@board[@x+1][y].nil? && !@board[@x+2][y].nil? && !@board[@x+3][y].nil?) || (@board[@x][y] == @board[@x+1][y-1] && @board[@x][y] == @board[@x+2][y-2] && @board[@x][y] == @board[@x+3][y-3] && !@board[@x+1][y-1].nil? && !@board[@x+2][y-2].nil? && !@board[@x+3][y-3].nil?) || (@board[@x][y] == @board[@x+1][y+1] && @board[@x][y] == @board[@x+2][y+2] && @board[@x][y] == @board[@x+3][y+3] && !@board[@x+1][y+1].nil? && !@board[@x+2][y+2].nil? && !@board[@x+3][y+3].nil?) || (@board[@x][y] == @board[@x][y+1] && @board[@x][y] == @board[@x][y+2] && @board[@x][y] == @board[@x][y+3] && !@board[@x][y+1].nil? && !@board[@x][y+2].nil? && !@board[@x][y+3].nil?) && !@board[@x][y].nil?)
    #       puts "You WON!!"
    #       exit
    #     end
    #   end
    # end
    check_vertical y
    check_horizontal y
    check_diagonal y
  end

  def check_vertical y
    y = y + 1
    (1..@rows_num).step do |i|
      if (@grid[i][y] != @initial_mark)
        if @grid[i][y] == @grid[i+1][y] && @grid[i][y] == @grid[i+2][y] && @grid[i][y] == @grid[i+3][y] 
          puts "Vertical win!"
          exit
        end
      end
    end
  end

  def check_horizontal y
    y = y + 1
    (1..@rows_num).step do |i|
      if (@grid[i][y] != @initial_mark)
        if @grid[i][y] == @grid[i][y+1] && @grid[i][y] == @grid[i][y+2] && @grid[i][y] == @grid[i][y+3] 
          puts "Horizontal win!"
          exit
        end
      end
    end
  end

  def check_diagonal y
    y = y + 1
    (1..@rows_num).step do |i|
      if (@grid[i][y] != @initial_mark)
        if @grid[i][y] == @grid[i+1][y+1] && @grid[i][y] == @grid[i+2][y+2] && @grid[i][y] == @grid[i+3][y+3] 
          puts "Diagonal win!"
          exit
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