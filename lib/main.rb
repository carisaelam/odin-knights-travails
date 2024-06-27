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

  moves
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

moves = possible_moves(7, 7)
p filter_possible_moves(moves)
