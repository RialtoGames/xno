module XNO
  class Tile
    attr_reader :state
    
    TILE_WIDTH = 100
    TILE_HEIGHT = 100
    BORDER_X = 20
    BORDER_Y = 20
    X_OS = 50
    Y_OS = XNO::Y_RES / 2 - ((BORDER_Y * 2 + TILE_HEIGHT * 3) / 2)
    
    def initialize x, y, state = :none
      _x = X_OS + (x * TILE_WIDTH)
      _y = Y_OS + (y * TILE_HEIGHT)
      puts "Pre: #{_x}, #{_y}"
      x != 0? h = BORDER_X * x: h = 0
      y != 0? v = BORDER_Y * y: v = 0
      _x, _y = _x + h, _y + v
      puts "Opt: #{_x}, #{_y}"
      @sprite = Sprite.new :primitive, _x, _y, Layer::UI, nil,
                           TILE_WIDTH, TILE_HEIGHT, true
      @state = state
      update
    end

    def draw
      @sprite.draw
    end

    def update
      if @state == 0
        @sprite.color = Gosu::Color.rgb(220, 250, 230)
      elsif @state == 1
        @sprite.color = Gous::Color.rgb(230, 250, 240)
      else
        @sprite.color = Gosu::Color.rgb(250, 230, 240)
      end
    end
  end
end
