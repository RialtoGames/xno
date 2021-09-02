class Tile
  TILE_WIDTH = 100
  TILE_HEIGHT = 100
  BORDER_X = 20
  BORDER_Y = 20
  X_OS = 50
  Y_OS = XNO::Y_RES / 2 - ((BORDER_Y * 2 + TILE_HEIGHT * 3) / 2)
  
  def initialize x, y, state
    @x = X_OS + (x * TILE_WIDTH)
    @y = Y_OS + (y * TILE_HEIGHT)
    y != 0? @v = BORDER_Y * y: @v = 0
    x != 0? @h = BORDER_X * x: @h = 0
    @vtate = state
  end

  def draw
    P.draw_solid @x + @h, @y + @v, TILE_WIDTH, TILE_HEIGHT
    P.draw_lines @x + @h, @y + @v, TILE_WIDTH + @x + @h, @y + @v,
                 TILE_WIDTH + @x + @h, TILE_HEIGHT + @y + @v,
                 @x + @h, TILE_HEIGHT + @y + @v, @x + @h, @y + @v
  end

  def update
    # ...
  end
end
