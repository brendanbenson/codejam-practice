f = File.open('B-large-practice.in')

o = File.new('B-large-practice.out', 'w')

cases = f.readline.to_i

cases.times do |i|
  
  #puts "Case \##{i}\n"
  
  # initialize the values
  params = f.readline.split " "
  total_chicks = params[0].to_i
  required_chicks = params[1].to_i
  barn_location = params[2].to_i
  time_limit = params[3].to_i
  
  chick_location = f.readline.split " "
  chick_speed = f.readline.split " "
  arrival_time = []
  
  total_chicks.times do |t|
    chick_location[t] = chick_location[t].to_i
    chick_speed[t] = chick_speed[t].to_i
    arrival_time[t] = ((barn_location.to_f - chick_location[t].to_f) / chick_speed[t].to_f).to_f
  end
  
  #o.syswrite arrival_time.to_s
  #o.syswrite "\n"
  
  # process the data
  remaining_chicks = total_chicks - 1
  impeding_chicks = 0
  swaps = 0
  message = nil
  while required_chicks > 0
    if remaining_chicks == -1
      message = "IMPOSSIBLE"
      break
    end
    if arrival_time[remaining_chicks] <= time_limit.to_f
      swaps = swaps + impeding_chicks
      required_chicks = required_chicks - 1
    else
      impeding_chicks = impeding_chicks + 1
    end
    remaining_chicks = remaining_chicks - 1
  end
  
  message ||= swaps
  
  # output the result
  o.syswrite "Case \##{i + 1}: #{message}\n"
  
end
