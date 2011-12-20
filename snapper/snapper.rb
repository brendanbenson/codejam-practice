f = File.open('A-large-practice.in')

o = File.new('A-large-practice.out', 'w')

cases = f.readline.to_i

cases.times do |i|
  
  #puts "Case \##{i + 1}\n"
  
  # parse the input and create the data structures
  params = f.readline.split " "
  n = params[0].to_i
  k = params[1].to_i
  
  # process the data  
  message = k.to_s(2)[-n, n]
  message ||= "0"
  message = message.include?("0") ? "OFF" : "ON"
  
  # output the result
  o.syswrite "Case \##{i + 1}: #{message}\n"
  
end
