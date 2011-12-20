f = File.open('A-large-practice.in')

o = File.new('A-large-practice.out', 'w')

def intersect? (rope_a, rope_b = [])
  if rope_a[0] > rope_b[0] && rope_a[1] < rope_b[1]
    return true
  elsif rope_a[0] < rope_b[0] && rope_a[1] > rope_b[1]
    return true
  end
  return false
end

cases = f.readline.to_i

cases.times do |c|
  
  # initialize the values
  lines = []
  line_ids = []
  total_lines = f.readline.to_i
  total_lines.times do |i|
    lines[i] = Array.new
    lines[i] = f.readline.split(" ")
    lines[i][0] = lines[i][0].to_i
    lines[i][1] = lines[i][1].to_i
    line_ids[i] = i
  end
  
  intersections = 0
  line_ids.combination(2).each do |combo|
    #puts combo.to_s
    intersections = intersections + 1 if intersect?(lines[combo[0]], lines[combo[1]])
  end
  
  # execute the code
  message = intersections
  o.syswrite "Case \##{c + 1}: #{message}\n"

end
