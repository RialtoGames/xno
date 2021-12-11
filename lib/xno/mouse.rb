require_relative 'game_object'
require_relative 'sprite'

module XNO
  class Mouse < GameObject
    attr_reader :sprite
    
    def initialize *args
      @frame_id = 0
      @sprite = Sprite.new 'cursor', 0, 0, Layer::CURSOR, false, 16, 16, true
      @event_queue = EventQueue.new source: :mouse
    end

    def update
      @sprite.x, @sprite.y = XNO.game.mouse_x, XNO.game.mouse_y
      @event_queue.update
    end

    def draw
      @sprite.draw
    end

    def switch_frame id
      @frame_id = id
    end
  end
end
