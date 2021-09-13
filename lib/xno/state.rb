module XNO
  # Basic program state creation and controll
  class State
    attr_reader :stack
    
    def initialize
      clear_stack
      parse_stack 'stack.list'
    end

    # Update all the objects from stack
    def update
      @stack.each_value do |object|
        object.update
      end
    end

    # Draw all the objects from stack
    def draw
      @stack.each_value do |object|
        object.draw
      end
    end

    private
    # Parse values and send a method to object from @stack
    def parse_stack path
      puts "Parsing the '#{path}' file"
      path = "../lib/xno/#{path}"
      File.foreach path do |line|
        line = line.split
        object = line[0].capitalize.to_sym.freeze
        args   = line[1..-1].collect do |x| atom(x).freeze end
        register_object object, args
      end if File.file? path or puts "File not found!"
    end

    def register_object object, args
      puts "Searching for #{object}.."
      ObjectSpace.each_object Class do |o|
        next unless o.name != nil and o.name.split('::').last.to_sym == object
        puts "#{object} REGISTERED"
        @stack[object] = o.new args
      end
    end

    # Parse text to atomic values
    def atom text
      case text
      when /^\d+$/
        value = text.to_i
      when '^true$'
        value = true
      when '^false$'
        value = false
      else
        value = text
      end
      puts "Atom #{value.class}"
      value
    end
    
    # Initialize the stack hash
    def clear_stack
      @stack = {}
    end
  end
end
