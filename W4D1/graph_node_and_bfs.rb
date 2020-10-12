require 'set'

class GraphNode
    attr_reader :value, :neighbors
    
    def initialize(value)
        @value = value
        @neighbors = []
    end

    def neighbors= (nodes)
        @neighbors = nodes
    end

    def self.bfs(starting_node, target_value)
        visited = Set.new
        queue = [starting_node]

        until queue.empty?
            curr_node = queue.pop
            visited.add(curr_node)
            return curr_node if curr_node.value == target_value
            curr_node.neighbors.each { |neighbor| queue.unshift(neighbor) unless visited.include?(neighbor) }
        end

        nil
    end

    def inspect
        value
    end

end


# a = GraphNode.new('a')
# b = GraphNode.new('b')
# c = GraphNode.new('c')
# d = GraphNode.new('d')
# e = GraphNode.new('e')
# f = GraphNode.new('f')
# g = GraphNode.new('g')
# a.neighbors = [b, c, e]
# c.neighbors = [b, d]
# e.neighbors = [a]
# f.neighbors = [e]
# g.neighbors = [a, b, f]

# p a.neighbors
# p GraphNode.bfs(a, 'c')
# p GraphNode.bfs(a, 'g')
# p GraphNode.bfs(g, 'e')