# Depth First Search
# Time: O(n + e) where n is the number of nodes in the graph and e is the number of edges.
# Space: O(n) where n is the number of nodes in the graph.
def possible_bipartition(dislikes)
  total_puppies = dislikes.length
  groups = {}
  stack = []

  (0...total_puppies).each do |i|
    if !groups[i]
      stack.push(i)
      groups[i] = 1
    end

    while !stack.empty?
      current = stack.pop 
      neighbors = dislikes[current]

      neighbors.each do |puppy|
        if !groups[puppy]
          stack.push(puppy)
          groups[puppy] = groups[current] * (-1)
        else
          if groups[puppy] == groups[current]
            return false
          end
        end
      end
    end
  end

  return true
end

# Breadth First Search
# Time: O(n + e) where n is the number of nodes in the graph and e is the number of edges.
# Space: O(n) where n is the number of nodes in the graph.
def possible_bipartition(dislikes)
  total_puppies = dislikes.length
  groups = {}
  queue = []

  (0...total_puppies).each do |i|
    if !groups[i]
      queue.push(i)
      groups[i] = 1
    end

    while !queue.empty?
      current = queue.shift 
      neighbors = dislikes[current]

      neighbors.each do |puppy|
        if !groups[puppy]
          queue.push(puppy)
          groups[puppy] = groups[current] * (-1)
        else
          if groups[puppy] == groups[current]
            return false
          end
        end
      end
    end
  end

  return true
end
