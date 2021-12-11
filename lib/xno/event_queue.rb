require_relative 'source'

# EventQueues are tracking semi-generic event sources
class EventQueue
  attr_reader :id
  
  def initialize options = {}
    @source = options[:source] || :mouse
    @source = "#{@source}_source"
    get_source_method @source
    @id = EventQueue.set_id
    clean
  end

  # Generic events update
  def update
    self.send @source, self
    @queue.each do |object, keywords|
      if keywords.class == Array
        object.send keywords[0], keywords[1..-1]
      else
        object.send keywords
      end
    end
  end

  # Initialize the event queue array
  def clean
    @queue = {}
  end
  
  def register keywords, object
    puts "REGISTER #{object}, #{keywords}"
    @queue[object] = keywords
  end

  private
  def get_source_method m
    define_singleton_method m, Source.method(m).to_proc
  end
  
  def self.id
    @id ||= 0
  end

  def self.set_id
    @id = id + 1
  end
end
