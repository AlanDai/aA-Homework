class Stack

    def initialize
        @underlying_array = []
    end

    def size
        @underlying_array.length
    end

    def empty?
        @underlying_array.empty?
    end

    def top
        @underlying_array[-1]
    end

    def peek(n)
        @underlying_array[-n..-1]
    end

    def push(n)
        @underlying_array << n
        size
    end

    def pop
        return nil if size == 0
        pop_val = @underlying_array[-1]
        @underlying_array.delete_at(-1)
        pop_val
    end
end