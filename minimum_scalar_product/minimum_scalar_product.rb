f = File.open('A-large-practice.in')

o = File.new('A-large-practice.out', 'w')

cases = f.readline.to_i

cases.times do |i|
  
  #puts "Case \##{i + 1}\n"
  
  # parse the input and create the data structures
  length = f.readline.chomp.to_i
  v1 = f.readline.chomp.split " "
  v2 = f.readline.chomp.split " "
  v1.each_index do |i|
    v1[i] = v1[i].to_i
    v2[i] = v2[i].to_i
  end
  
  # process the data
  v1.sort! {|a,b| a <=> b}
  v2.sort! {|a,b| b <=> a}
  
  total = 0
  v1.each_index do |i|
    total = total + (v1[i] * v2[i])
  end
  
  # output the result
  message = total
  o.syswrite "Case \##{i + 1}: #{message}\n"
  
end
