# Event 
class Event
  attr_reader :key, :keywords
  
  def initialize key, keywords = []
    @key, @keywords = key, keywords
  end
end

# EventQueues can source from keyboard or mouse
class EventQueue
  def initialize options = {}
    @source = options[:source] || :mouse
    @id = set_id
    clean
  end

  def update
    # ..
  end

  # Initialize the event queue array
  def clean
    @queue = []
  end

  def register key, keywords
    @queue << Event.new(key, keywords)
    Source.
  end

  private
  def self.id
    @id ||= 0
  end

  def self.set_id
    @id = id + 1
  end

  def self.reset_id
    @id = 0
  end
end
