module XNO
  class Tile
    attr_reader :state
    
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
      @state = state
      update
    end

    def draw
      P.draw_solid @x + @h, @y + @v, TILE_WIDTH, TILE_HEIGHT, @color
      P.draw_lines @x + @h, @y + @v, TILE_WIDTH + @x + @h, @y + @v,
        TILE_WIDTH + @x + @h, TILE_HEIGHT + @y + @v,
        @x + @h, TILE_HEIGHT + @y + @v, @x + @h, @y + @v
    end

    def update
      if @state == 0
        @color = Gosu::Color.new(220, 250, 230)
      elsif @state == 1
        @color = Gous::Color.new(230, 250, 240)
      else
        @color = Gosu::Color.new(250, 230, 240)
      end
    end
  end
end
