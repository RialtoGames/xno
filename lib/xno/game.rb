require 'gosu'

module XNO
  X_RES = 1920 / 2
  Y_RES = 1080 / 2
  FPS = 30

  require_relative 'cursor'
  require_relative 'primitives'
  require_relative 'board'
  require_relative 'state'
  
  class Game < Gosu::Window
    def initialize
      super X_RES, Y_RES, fullscreen: false, update_interval: 1000.0 / FPS
      self.caption = "X and O"
      @cursor = Cursor.new
      @board = Board.new 3, 3
      # @keyboard = Keyboard.new
      # @event_queue = EventQueue.new :mouse
      # @stat = Stat.new self.fps
    end

    def self.main_loop *args
      new(*args).show
    end

    def draw
      # @stat.draw
      @cursor.draw
      @board.draw
    end

    def update
      @event_queue.update
      @board.update
    end

    private
    def mouse_position
      return mouse_x, mouse_y
    end
  end
end
