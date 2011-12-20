start = Time.now

f = File.open('A-small-practice.in')

o = File.new('A-small-practice.out', 'w')

metadata = f.readline.split(" ")

total_letters = metadata[0].to_i
total_words = metadata[1].to_i
total_cases = metadata[2].to_i

word_hash = {}
letter_hash = {}
word_length = 0

# build word lookup hash
total_words.times do |i|
  word = f.readline.chomp
  word_length = word.length
  word_hash[word] = true
  word.each_char do |char|
    letter_hash[char] ||= true
  end
  
  word_length.times do |v|
    word_hash[word[0..(0-v)]] = false
  end
end

def check_permutations (letter_array, word_hash, i = 0, word = "")
  if letter_array[i] == nil
    if word_hash.has_key?(word)
      return 1
    else
      return 0
    end
    return
  end
  
  total_words = 0
  
  letter_array[i].each do |possible_letter|
    total_words += check_permutations(letter_array, word_hash, i + 1, word + possible_letter) if word_hash.has_key?(word + possible_letter)
  end
  
  return total_words
  
end

total_cases.times do |i|
  
  puts "Case #{i}\n"
  
  # initialize the values
  letter_array = []
  begin
    letters = f.readline.chomp.split ""
  rescue
    break
  end
  
  # execute the code
  v = 0
  inparens = false
  letters.each do |letter|
    if letter == "("
      inparens = true
      next
    elsif letter == ")"
      inparens = false
      v = v + 1
      next
    end
    letter_array[v] ||= Array.new
    letter_array[v].push letter if letter_hash.has_key? letter
    v = v + 1 unless inparens
  end
  
  # The letter_array has been built.
  # Now, recursively check each permutation
  
  message = check_permutations(letter_array, word_hash) if letter_array.length == word_length
 
  o.syswrite "Case \##{i + 1}: #{message}\n"
  
end

ending = Time.now
difference = ending - start
puts "Total run time: " + difference.to_s