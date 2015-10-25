require_relative './game'

class Checker
  attr_reader :columns_num, :rows_num
  attr_accessor :cells, :x, :y

  def initialize columns_num = nil, rows_num = nil
    @columns_num = 7
    @rows_num = 6
    @cells = []
    @x = 0
    @y = 0
    @game = Game.new
  end

  def drop_at_column column
    @x += 1
    @y = column
  end

  def type
    @game.color(@players[0]) ? "black" : "white"
  end
end

game = Game.new
checker = Checker.new
checker.drop_at_column 1
checker.drop_at_column 2