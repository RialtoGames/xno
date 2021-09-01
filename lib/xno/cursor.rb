class Cursor < Sprite
  def initialize
    super Gosu.mouse_x, Gosu.mouse_y
  end
end
