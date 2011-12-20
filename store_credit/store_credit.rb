f = File.open('A-small-practice.in')

o = File.new('A-small-practice.out', 'w')

cases = f.readline.to_i

cases.times do |i|
  
  # initialize the values
  credit = f.readline.to_i
  items = f.readline.to_i
  prices = f.readline.split(" ")
  prices.each_index do |index|
    prices[index] = prices[index].to_i
  end
  
  # find the best combination
  prices.each_index do |first|
    unless prices[first] > credit
      prices.each_index do |second|
        next if second <= first
        if prices[first] + prices[second] == credit
          o.syswrite "Case \##{i + 1}: #{first + 1} #{second + 1}\n"
        end
      end
    end
  end
  
end
