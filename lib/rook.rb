# return all possible moves for knight at (x, y)
def possible_moves(position)
  x = position[0]
  y = position[1]
  moves = []
  moves.push([x, y + 1])
  moves.push([x, y + 2])
  moves.push([x, y + 3])
  moves.push([x, y + 4])
  moves.push([x, y + 5])
  moves.push([x, y + 6])
  moves.push([x, y + 7])
  moves.push([x, y - 1])
  moves.push([x, y - 2])
  moves.push([x, y - 3])
  moves.push([x, y - 4])
  moves.push([x, y - 5])
  moves.push([x, y - 6])
  moves.push([x, y - 7])
  moves.push([x + 1, y])
  moves.push([x + 2, y])
  moves.push([x + 3, y])
  moves.push([x + 4, y])
  moves.push([x + 5, y])
  moves.push([x + 6, y])
  moves.push([x + 7, y])
  moves.push([x - 1, y])
  moves.push([x - 2, y])
  moves.push([x - 3, y])
  moves.push([x - 4, y])
  moves.push([x - 5, y])
  moves.push([x - 6, y])
  moves.push([x - 7, y])

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

p possible_moves([3, 3])
pp adjacency_list_hash
