require_relative 'tile'

class Board
  def initialize width, height
    @width, @height = width, height
    clear
  end

  def update
    # virtual ..
  end

  def draw
    for y in 0..@height - 1
      for x in 0..@width - 1
        @map[[x, y]].draw
      end
    end
  end

  def get x, y
    @map[[x, y]]
  end

  def set x, y, mod
    @map[[x, y]] = mod
  end
  
  private
  def clear
    @map = {}
    @width.times do |x|
      @height.times do |y|
        @map[[x, y]] = Tile.new x, y, 0
      end
    end
  end
end
