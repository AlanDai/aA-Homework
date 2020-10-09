# Exercise 1 - Stack

class Stack

    def initialize
        @values = []
    end

    def push(el)
        @values << el
    end

    def pop
        @values.delete_at(-1) if values.length > 0
    end

    def peek
        @values.length > 0 ? values[-1] : nil
    end

end


# Exercise 2 - Queue

class Queue

    def initialize
        @values = []
    end

    def enqueue(el)
        @values << el
    end

    def dequeue
        @values.shift if @values.length > 0
    end

    def peek
        @values.length > 0 ? values[0] : nil
    end

end


# Exercise 3 - Map

class Map

    def initialize
        @kv_pairs = []
    end

    def set(key, value)
        update = false
        (0...@kv_pairs.length).each do |i|
            if @kv_pairs[i][0] == key
                update = true
                @kv_pairs[i][0] = value
            end
        end
        @kv_pairs << [key, value] unless update
    end

    def get(key)
        value = nil
        @kv_pairs.each { |pair| value = pair[1] if pair[0] == key }
        value
    end

    def delete(key)
        (0...@kv_pairs.length).each do |i| 
            if @kv_pairs[i][0] == key
                @kv_pairs.delete_at(i)
                break
            end
        end
    end

    def show
        map_str = ""
        @kv_pairs.each { |pair| map_str += "#{pair[0]}=>#{pair[1]}, "}
        map_str.length > 0 ? (puts "{#{map_str[0..-3]}}") : puts "{}"
    end
end