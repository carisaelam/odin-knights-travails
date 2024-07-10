# return all possible moves for knight at (x, y)
def possible_moves(position)
  x = position[0]
  y = position[1]
  moves = []
  moves.push([x + 1, y + 2])
  moves.push([x + 1, y - 2])
  moves.push([x - 1, y + 2])
  moves.push([x - 1, y - 2])
  moves.push([x + 2, y + 1])
  moves.push([x + 2, y - 1])
  moves.push([x - 2, y + 1])
  moves.push([x - 2, y - 1])

  filter_possible_moves(moves)
end

# filter out illegal moves
def filter_possible_moves(moves)
  legal_moves = []

  moves.each do |move|
    next unless move[0].between?(0, 7) && move[1].between?(0, 7)

    legal_moves.push(move)
  end

  legal_moves
end

# build graph of all possible knight moves
def adjacency_list_hash
  adjacency_list_hash = {}
  (0..7).each do |x|
    (0..7).each do |y|
      moves = possible_moves([x, y])
      adjacency_list_hash[[x, y]] = moves
    end
  end
  adjacency_list_hash
end

# return shortest path between start and target
def bfs_traversal(starting_position = [0, 0], target = [1, 2])
  return [starting_position] if starting_position == target

  queue = [[starting_position]]
  visited = Set.new([starting_position])

  until queue.empty?
    current_path = queue.shift
    current_position = current_path.last

    adjacency_list_hash[current_position].each do |position|
      next if visited.include?(position)

      visited.add(position)
      new_path = (current_path + [position])

      return new_path if position == target

      queue.push(new_path)
    end

  end
end

def knight_moves(start_position, end_position)
  path = bfs_traversal(start_position, end_position)
  distance = path.size - 1
  p "The shortest distance from #{start_position} to #{end_position} was: #{distance} moves. The path was #{path}"
end

# knight_moves([3, 3], [4, 3])
p bfs_traversal([0, 0], [6, 6])
