def possible_bipartition(dislikes)
  visited_hash = {}
  group_hash = {}

  total_puppies = dislikes.length

  total_puppies.times do |current_puppy|
    if !visited_hash[current_puppy]
      visited_hash[current_puppy] = true
      group_hash[current_puppy] = true
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
