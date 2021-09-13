require 'gosu'

module XNO
  X_RES = 1920 / 2
  Y_RES = 1080 / 2
  FPS = 30

  def self.game
    @game
  end
  
  def self.main_loop
    (@game = Game.main_loop).show
  end

  require_relative 'primitives'
  require_relative 'cursor'
  require_relative 'board'
  require_relative 'state'
  
  class Game < Gosu::Window
    def initialize
      super X_RES, Y_RES, fullscreen: false, update_interval: 1000.0 / FPS
      self.caption = "X and O"
      @state = State.new
    end

    def self.main_loop *args
      new(*args)
    end

    def draw
      @state.draw
    end

    def update
      @state.update
    end

    def needs_cursor?
      false
    end
  end
end
