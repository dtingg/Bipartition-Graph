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
