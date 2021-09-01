class Board
  # TODO: Shrink tile size
  TILE_WIDTH = 100
  TILE_HEIGHT = 100
  BORDER_X = 20
  BORDER_Y = 20
  X_OS = 50
  Y_OS = XNO::Y_RES / 2 - ((BORDER_Y * 2 + TILE_HEIGHT * 3) / 2)
  
  def initialize width, height
    @width, @height = width, height
    # clear
  end

  def update
    # virtual ..
  end

  def draw
    for y in 0..@height - 1
      for x in 0..@width - 1
        draw_tile x, y
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
  def draw_tile ax, ay
    x = X_OS + (ax * TILE_WIDTH)
    y = Y_OS + (ay * TILE_HEIGHT)
    ay != 0? s = BORDER_Y * ay: s = 0
    ax != 0? v = BORDER_X * ax: v = 0
    # puts "#{x}, #{y}, #{s}"
    Gosu.draw_rect x + v, y + s, TILE_WIDTH, TILE_HEIGHT,
      Gosu::Color.new(220, 250, 230), 1
    draw_border x + v, y + s, TILE_WIDTH + x + v, y + s,
                TILE_WIDTH + x + v, TILE_HEIGHT + y + s,
                x + v, TILE_HEIGHT + y + s, x + v, y + s
  end

  def draw_border *points
    faces = points.each_slice(2).to_a
    last_face = []
    faces.each.with_index do |face, index|
      if index != 0
        Gosu.draw_line last_face[0], last_face[1], Gosu::Color.new(40, 240, 140),
                       face[0], face[1], Gosu::Color.new(200, 250, 200), 2
      end
      last_face = face
    end
  end
  
  def clear
    @map = {}
    @width.times do |i|
      @height.times do |j|
        @map[[i, j]] = 0
      end
    end
  end
end
