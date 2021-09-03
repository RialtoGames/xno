class Cursor
  def initialize
    @texture = Gosu::Image.load_tiles '../assets/cursor.png',
                                      16, 16, retro: true
  end

  def update
    # ...
  end

  def draw
    @texture.draw Gosu::mouse_x, Gosu.mouse_y
  end
end
