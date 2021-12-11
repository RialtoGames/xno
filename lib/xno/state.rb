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

    # def get_text_entries

    # end

    # Grab the most top layer object on a given position
    def get_by_position position
      # Position is a hash containing {x, y}
      drawable = []
      matched = []
      m_index = 0

      # Get drawable objects
      # [*] This should be removed in favor of GO's drawable feature
      @stack.each_value do |object|
        begin
          object.public_method(:@sprite)
        rescue
          # Check if object contains a grid
          if map = object.instance_variable_get(:@map).freeze
            warn "Store drawable tiles"
            # Store the whole grid to the drawable array
            map.each_value.with_index do |tile, index|
              drawable[index] = tile
              m_index += index
            end
            next
          end
          warn "Skip a none drawable object (#{object.to_s}).."
          next
        end
        puts "Object #{object.to_s} is drawable"
        drawable[m_index] = object
        m_index += 1
      end
      
      # Compare positions
      drawable.each do |object|
        if object.sprite.x < position[:x] and
           object.sprite.x + object.sprite.width > position[:x] and
           object.sprite.y < position[:y] and
           object.sprite.y + object.sprite.height > position[:y]
            puts "Collision check:"
            puts "#{object.sprite.x} < #{position[:x]} and\n" \
                 "#{object.sprite.x + object.sprite.width} > #{position[:x]} and\n" \
                 "#{object.sprite.y} < #{position[:y]} and\n" \
                 "#{object.sprite.y + object.sprite.height} > #{position[:y]}"
            
            puts "Object #{object.to_s} in range"
            matched.push object
        end
      end

      # return matched
      
      # TODO: Move up to update method
      # Compare layers
      if !matched.empty?
        # Optimize this with some better sorting algorithm.. or actually bubble
        # sort is not bad for this purpose?
        tmp = GameObject.new
        matched.each.with_index do |object, index|
          if index == 0
            tmp = object
          else
            tmp = object if object.sprite.layer > tmp.sprite.layer
          end
          puts "Selected #{tmp.to_s}"
        end
        return tmp
      else
        return false
      end
    end

    private
    # Parse values and send a method to object from @stack
    def parse_stack path
      puts "Parsing the '#{path}' file"
      path = "../lib/xno/#{path}"
      File.foreach path do |line|
        next if line[0] == '#'
        line = line.split
        object = line[0].split('_').collect do |word|
          word = word.capitalize
        end.join.to_sym.freeze
        args   = line[1..-1].collect do |x| atom(x).freeze end
        register_object object, args
      end if File.file? path or puts "File not found!"
    end

    def register_object object, args
      done = false
      ObjectSpace.each_object Class do |o|
        next unless o.name != nil and o.name.split('::').last.to_sym == object
        puts "#{object.upcase} REGISTERED"
        @stack[object] = o.new args
        done = true
      end
      warn "#{object} not found" if done == false
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
