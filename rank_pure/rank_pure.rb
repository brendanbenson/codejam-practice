f = File.open('C-small-practice.in')

o = File.new('C-small-practice.out', 'w')

solved = []

cases = f.readline.to_i

cases.times do |i|
  
  #puts "Case \##{i}\n"
  
  # parse the input and create the data structures
  n = f.readline.to_i
  n = n + 1
  set = []
  
  puts "Case \##{i + 1}: #{n}\n"
  
  unless solved[n]
    
    # process the data
    2.upto(n) do |v|
      set[v] = v
    end
    set = set.drop(2)
    
    count = 0
    set.length.times do |t|
      combinations = set.combination(t + 1) do |c|
        next if c == []
        next if c[0] > 2
        next if c.last != n
        cur = n
        while true
          if cur == 2
            count = count + 1
            #o.syswrite c.to_s
            #o.syswrite "\n"
            break
          end
          break if c.index(cur) == nil
          cur = c.index(cur) + 1
        end
      end
    end
    
    solved[n] = count % 100003
    
  end
  
  #puts set.to_s
  
  # output the result
  message = solved[n]
  o.syswrite "Case \##{i + 1}: #{message}\n"
  
end
