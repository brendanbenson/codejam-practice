f = File.open('A-small-practice.in')

o = File.new('A-small-practice.out', 'w')

cases = f.readline.to_i

cases.times do |i|
  
  #puts "Case \##{i + 1}\n"
  
  # parse the input and create the data structures
  
  # process the data
  
  # output the result
  message = ""
  o.syswrite "Case \##{i + 1}: #{message}\n"
  
end
