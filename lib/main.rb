# return all possible moves for knight at (x, y)
def possible_moves(x, y)
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

# return adjacency list for position
def adjacency_list(possible_moves)
  adjacency_list = []
  possible_moves.each_with_index do |move, i|
    x = move[0]
    y = move[1]
    adjacency_list.push(possible_moves(x, y))
    # puts "move: #{move} / index: #{i}"
    # puts "adj_list for move #{i}:
    # #{possible_moves(x, y)}\n\n"
  end
  adjacency_list
end

p adjacency_list(possible_moves(0, 0))
