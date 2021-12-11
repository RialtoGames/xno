module Source
  private
  def self.mouse_source event_queue
    # Get mouse button and position
    event = :none
    if Gosu.button_down? Gosu::MsLeft
      event = :lms_down
      @position = {x: XNO::game.mouse_x, y: XNO::game.mouse_y}
    end
    if Gosu.button_down? Gosu::MsRight
      event = :rms_down
      @position = {x: XNO::game.mouse_x, y: XNO::game.mouse_y}
    end
    # Get selected object
    if event != :none
      object = XNO::game.state.get_by_position @position
      puts "#{event}:#{object.to_s}:#{@position}"
      event_queue.register event, object if object != false
    end
  end

  def self.keyboard_source event_queue
    # Get pressed key
    @key
  end

  def self.repl_source event_queue
    # Get chat message
    @current_message
  end
end
