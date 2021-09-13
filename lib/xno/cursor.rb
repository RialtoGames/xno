require_relative 'game_object'

module XNO
  class Cursor < GameObject
    def initialize *args
      @texture = Gosu::Image.load_tiles '../assets/cursor.png',
                 16, 16, retro: true
      @texture = @texture[0]
    end

    def update
      # ...
    end

    def draw
      @texture.draw XNO.game.mouse_x, XNO.game.mouse_y, 10
    end
  end
end
