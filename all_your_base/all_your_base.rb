f = File.open('A-large-practice.in')

o = File.new('A-large-practice.out', 'w')

cases = f.readline.to_i

cases.times do |i|
  
  #puts "Case \##{i + 1}\n"
  
  # parse the input and create the data structures
  order = ['1', '0', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
  line = f.readline.chomp
  visited = {}
  uniques = 0
  result = ""
  
  # process the data
  line.each_char do |char|
    unless visited.has_key? char
      visited[char] = uniques
      uniques = uniques + 1
    end
    result = result + order[visited[char]]
  end
  
  # output the result
  uniques = uniques < 2 ? 2 : uniques
  message = result.to_i(uniques)
  o.syswrite "Case \##{i + 1}: #{message}\n"
  
end
