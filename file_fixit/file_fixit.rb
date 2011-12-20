f = File.open('A-large-practice.in')

o = File.new('A-large-practice.out', 'w')

cases = f.readline.to_i

cases.times do |i|
  
  #puts "Case \##{i}\n"
  
  # parse the input and create the data structures
  params = f.readline.split " "
  existing = params[0].to_i
  to_create = params[1].to_i
  dirs = {}
  total = 0
  
  # process the data
  existing.times do |t|
    path = f.readline.chomp
    folders = path.split "/"
    folders = folders.drop 1
    while !folders.empty?
      dirs[path] = true
      folder = folders.pop.to_s
      path = path[0..-(folder.length + 2)]
    end
  end
  
  to_create.times do |t|
    path = f.readline.chomp
    folders = path.split "/"
    folders = folders.drop 1
    while !folders.empty?
      if !dirs.has_key? path
        total = total + 1
      end
      dirs[path] = true
      folder = folders.pop.to_s
      path = path[0..-(folder.length + 2)]
    end
  end
  
  #o.syswrite dirs.to_s
  #o.syswrite "\n"
  
  # output the result
  message = total
  o.syswrite "Case \##{i + 1}: #{message}\n"
  
end
