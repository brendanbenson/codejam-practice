f = File.open('A-large-practice.in')

o = File.new('A-large-practice.out', 'w')

def next_move (pos, color, stack)
  next_move = stack.find_index(color)
  return nil if next_move == nil
  next_position = stack[next_move + 1].to_i
  if pos < next_position
    return "+"
  elsif pos > next_position
    return "-"
  elsif pos == next_position
    if next_move == 0
      return "p"
    else
      return "w"
    end
  end
end

cases = f.readline.to_i

cases.times do |i|
  
  #puts "Case \##{i + 1}\n"
  
  # parse the input and create the data structures
  seq = f.readline.chomp.split " "
  buttons = seq[0].to_i
  stack = seq.drop(1)
  
  # process the data
  opos = 1
  bpos = 1
  time = 0
  moves = {"+" => 1, "-" => -1, "p" => 0, "w" => 0}
  while buttons > 0
    bmove = next_move(bpos, "B", stack)
    bpos = bpos + moves[bmove] if bmove != nil
    omove = next_move(opos, "O", stack)
    opos = opos + moves[omove] if omove != nil
    if bmove == "p" || omove == "p"
      stack = stack.drop(2)
      buttons = buttons - 1
    end
    time = time + 1
  end
  
  # output the result
  message = time
  o.syswrite "Case \##{i + 1}: #{message}\n"
  
end
