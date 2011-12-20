f = File.open('B-large-practice.in')

o = File.new('B-large-practice.out', 'w')

cases = f.readline.to_i

cases.times do |i|
  
  # initialize the values
  words = f.readline.split " "
  
  # execute the code
  words.reverse!
  
  o.syswrite "Case \##{i + 1}:"
  words.each do |word|
    o.syswrite " #{word}"
  end
  o.syswrite "\n"
  
end
