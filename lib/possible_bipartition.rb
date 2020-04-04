
def possible_bipartition(dislikes)
  group_hash = {}

  visited_hash = {}

  length = dislikes.length

  current_group = true

  length.times do |current_puppy|
    if !visited_hash[current_puppy]
      group_hash[current_puppy] = current_group
      visited_hash[current_puppy] = true
    end

    queue = dislikes[current_puppy]

    while !queue.empty?
      check_puppy = queue.pop
      if visited_hash[check_puppy]
        return false if group_hash[check_puppy] == group_hash[current_puppy]
      else
        group_hash[check_puppy] = !group_hash[current_puppy]
        visited_hash[check_puppy] = true
      end
    end
    current_group = !current_group
  end

  return true
end
