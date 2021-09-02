require 'gosu'

module XNO
  X_RES = 1920 / 2
  Y_RES = 1080 / 2
  FPS = 30

  require_relative 'primitives'
  require_relative 'board'
  
  class Game < Gosu::Window
    def initialize
      # @cursor = Cursor.new
      # @keyboard = Keyboard.new
      # @stat = Stat.new self.fps
      @board = Board.new 3, 3
      super X_RES, Y_RES, fullscreen: false, update_interval: 1000.0 / FPS
      self.caption = "X and O"
    end

    def self.main_loop *args
      new(*args).show
    end

    def draw
      # @stat.draw
      # @cursor.draw
      @board.draw
    end

    def update
      @board.update
    end
  end
end
