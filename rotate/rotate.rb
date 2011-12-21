f = File.open('A-large-practice.in')

o = File.new('A-large-practice.out', 'w')

def print_board (board)
  board.each do |row|
    puts row.to_s
  end
  puts "\n"
end

down = Proc.new { |coords|
  [coords[0] + 1, coords[1]]
}

right = Proc.new { |coords|
  [coords[0], coords[1] + 1]
}

downright = Proc.new { |coords|
  [coords[0] + 1, coords[1] + 1]
}

downleft = Proc.new { |coords|
  [coords[0] + 1, coords[1] - 1]
}

def check(board, color, total, goal, direction, coords)
  if total == goal
    return color
  elsif coords[0] == board.length || coords[1] == board.length
    return ""
  elsif board[coords[0]][coords[1]] == color || total == 0
    return check(board, color, total + 1, goal, direction, direction.call(coords))
  else
    return ""
  end
end

cases = f.readline.to_i

cases.times do |i|
  
  #puts "Case \##{i + 1}\n"
  
  # parse the input and create the data structures
  n, k = f.readline.chomp.split " "
  n = n.to_i
  k = k.to_i
  board = []
  n.times do |t|
    row = f.readline.chomp.split ""
    board[t] = row
  end
  
  # push everything to the right
  n.times do |iteration|
    n.times do |row|
      n.times do |col|
        piece = board[row][col]
        pieceright = board[row][col + 1]
        if piece != "." && pieceright == "."
          board[row][col + 1] = piece
          board[row][col] = "."
        end
      end
    end
  end
  
  # check for a winner
  winners = ""
  n.times do |row|
    n.times do |col|
      if board[row][col] != "."
        winners = winners + check(board, board[row][col], 0, k, down, [row, col])
        winners = winners + check(board, board[row][col], 0, k, right, [row, col])
        winners = winners + check(board, board[row][col], 0, k, downright, [row, col])
        winners = winners + check(board, board[row][col], 0, k, downleft, [row, col])
      end
    end
  end
  
  # output the result
  message = ""
  if winners == ""
    message = "Neither"
  elsif winners.include?("R") && winners.include?("B")
    message = "Both"
  elsif winners.include? "R"
    message = "Red"
  else
    message = "Blue"
  end
  o.syswrite "Case \##{i + 1}: #{message}\n"
  
end
