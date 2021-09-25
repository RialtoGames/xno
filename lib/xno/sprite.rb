module Layer
  BACKGROUND, UI, FONT, CURSOR = *0..3
  def self.sym symbol
    self.const_get symbol
  end
  def self.last
    self.constants.size
  end
end

require_relative 'primitives'
#require_relative 'render'

class Sprite
  attr_accessor :x, :y
  attr_reader :width, :height, :layer
  attr_writer :color, :border
  
  def initialize texture, x, y, layer = XNO::Layer.last, animate = nil,
                 width = 0, height = 0, border = false, color = [255, 255, 0]
    @x, @y   = x, y
    @border  = border
    @width   = width
    @height  = height
    @layer   = layer
    @animate = animate # => false || true || nil

    if texture == :primitive
      @color = Gosu::Color.rgb color[0], color[1], color[2]
      define_singleton_method :draw do
        draw_shape
      end
    else
      define_singleton_method :draw do
        draw_image
      end
      if@animate != nil
        @texture = Gosu::Image.load_tiles "../assets/#{texture}.png",
                   @width, @height, retro: true
        @frame_id = 0
        @texture = @texture[@frame_id]
      else
        @texture = Gosu::Image.new "../assets/#{texture}.png",
                   @width, @height
      end
    end
  end

  protected
  def draw_image
    @texture.draw @x, @y, @layer
    draw_border
  end

  def draw_shape
    P.draw_solid @x, @y, @width, @height, @color
    draw_border
  end
  
  def draw_border
    P.draw_lines @x, @y, @width + @x, @y,
                 @width + @x, @height + @y,
                 @x, @height + @y, @x, @y if @border
  end
end
