require 'set'

class LRUCache
    attr_reader :count

    def initialize(capacity)
        @capacity = capacity
        @cache = {}
    end

    def add(val)
        @cache.delete(val)
        @cache[val] = true
        if @cache.size > @capacity
            first_key = @cache.first[0]
            @cache.delete(first_key)
        end
    end

    def show
        puts @cache
    end
end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

p johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})

p johnny_cache.show