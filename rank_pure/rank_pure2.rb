f = File.open('C-small-practice.in')

o = File.new('C-small-practice.out', 'w')

solved = []

def a007059 (p, h)
  result = 
  return result
end

cases = f.readline.to_i

cases.times do |i|
  
  #puts "Case \##{i}\n"
  
  # parse the input and create the data structures
  n = f.readline.to_i
  n = n + 1
  set = []
  
  #puts "Case \##{i + 1}: #{n}\n"
  
  unless solved[n]
    
    count = a007059(1,0)
    
    puts count
    
    solved[n] = count % 100003
    
  end
  
  #puts set.to_s
  
  # output the result
  message = solved[n]
  o.syswrite "Case \##{i + 1}: #{message}\n"
  
end
