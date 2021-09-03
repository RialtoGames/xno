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
        object.update
      end
    end

    private
    # !!! Research sending arguments !!!
    def parse_stack path
      File.each_line path do |line|
        line = line.split
        @stack[line[0].to_sym].send 
      end if File.file? path
    end

    # Parse text to atomic values
    def atom
      
    end
    
    # Initialize the stack hash
    def clear_stack
      @stack = {}
    end
  end
end
