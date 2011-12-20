f = File.open('A-small-practice.in')

o = File.new('A-small-practice.out', 'w')

cases = f.readline.to_i

cases.times do |i|
  
  # initialize the values
  
  # execute the code
  
  o.syswrite "Case \##{i + 1}: #{message}\n"
  
end
