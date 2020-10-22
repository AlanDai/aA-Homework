require_relative 'stack'

class SmartStack < Stack

    def initialize(n)
        @max_size = n
        @underlying_array = []
    end

    def max_size
        @max_size
    end

    def full?
        @underlying_array.length == max_size
    end

    def push(*args)
        raise 'stack is full' if args.length > max_size - @underlying_array.length

        @underlying_array.concat(args)
        @underlying_array.length
    end

    def pop(n=1)
        removed_items = []
        until n == 0
            if @underlying_array.empty?
                removed_items << nil
            else
                removed_items << @underlying_array[-1]            
                @underlying_array.delete_at(-1)
            end
                n -= 1
        end
        removed_items
    end

end