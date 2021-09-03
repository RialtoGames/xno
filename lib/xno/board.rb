require_relative 'tile'

# A simple 2D grid structure, holding Tiles abstraction
class Board
  def initialize width, height
    @width, @height = width, height
    clear
  end

  def update
    scan_map do |x, y|
      @map[[x, y]].update
    end
  end

  def draw
    scan_map do |x, y|
      @map[[x, y]].draw
    end         
  end

  # Map getter
  def get x, y
    @map[[x, y]]
  end

  # Map setter
  def set x, y, mod
    @map[[x, y]] = mod
  end
  
  private
  def scan_map
    for y in 0..@height - 1
      for x in 0..@width - 1
        yield x, y
      end
    end
  end

  # Initialize the map hash
  def clear
    @map = {}
    @width.times do |x|
      @height.times do |y|
        @map[[x, y]] = Tile.new x, y, 0
      end
    end
  end
end
