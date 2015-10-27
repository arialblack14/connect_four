require_relative './game'

class Checker
  attr_reader :columns_num, :rows_num
  attr_accessor :cells, :position, :grid

  def initialize columns_num = nil, rows_num = nil
    @columns_num = 7
    @rows_num = 6
    @cells = []
    @position = {}
    @game = Game.new
    @grid = []
  end

  def drop_at_column x, y
    if @grid[x][y].nil?
      puts @grid[x][y] = 1
    else
      puts "Invalid move"
    end
  end

  def create_grid cols, rows
    @grid = Array.new(@rows_num, Array.new(@columns_num, 0))
  end
end

game = Game.new
checker = Checker.new
checker.drop_at_column(5,6)