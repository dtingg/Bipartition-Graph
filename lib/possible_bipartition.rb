# Depth First Search
# Time: O(n + e) where n is the number of nodes in the graph and e is the number of edges.
# Space: O(n) where n is the number of nodes in the graph.
def possible_bipartition(dislikes)
  total_puppies = dislikes.length

  visited = {}
  groups = {}

  stack = []

  (0...total_puppies).each do |i|
    if !visited[i]
      stack.push(i)
      visited[i] = true
      groups[i] = true
    end

    while !stack.empty?
      current = stack.pop 

      neighbors = dislikes[current]

      neighbors.each do |puppy|
        if !visited[puppy]
          stack.push(puppy)
          visited[puppy] = true
          groups[puppy] = !groups[current]
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

  visited = {}
  groups = {}

  queue = []

  (0...total_puppies).each do |i|
    if !visited[i]
      queue.push(i)

      visited[i] = true
      groups[i] = true
    end

    while !queue.empty?
      current = queue.shift 

      neighbors = dislikes[current]

      neighbors.each do |puppy|
        if !visited[puppy]
          queue.push(puppy)
          visited[puppy] = true
          groups[puppy] = !groups[current]
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
