class Checker
  attr_reader :columns_num, :rows_num
  attr_accessor :x, :y

  def initialize columns_num = nil, rows_num = nil
    @columns_num = 7
    @rows_num = 6
    @x = 0
    @y = 0
  end

  def drop_at_column column
    puts @x += 1
    @y = column
  end


end

checker = Checker.new
checker.drop_at_column 1
checker.drop_at_column 2