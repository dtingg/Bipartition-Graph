def possible_bipartition(dislikes)
  visited_hash = {}
  group_hash = {}

  total_puppies = dislikes.length

  total_puppies.times do |current_puppy|
    if !visited_hash[current_puppy]
      visited_hash[current_puppy] = true

      check_puppies = dislikes[current_puppy]

      next_group = true

      check_puppies.each do |puppy|
        if group_hash[puppy]
          next_group = !group_hash[puppy]
          break
        end
      end

      group_hash[current_puppy] = next_group
    end

    queue = dislikes[current_puppy]

    while !queue.empty?
      check_puppy = queue.pop

      if visited_hash[check_puppy]
        return false if group_hash[check_puppy] == group_hash[current_puppy]
      else
        visited_hash[check_puppy] = true
        group_hash[check_puppy] = !group_hash[current_puppy]
      end
    end
  end

  return true
end
