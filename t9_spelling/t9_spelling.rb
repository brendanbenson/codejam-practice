f = File.open('C-large-practice.in')

o = File.new('C-large-practice.out', 'w')

letter_codes = {}
# develop our lookup hash
letter_codes["a"] = "2"
letter_codes["b"] = "22"
letter_codes["c"] = "222"
letter_codes["d"] = "3"
letter_codes["e"] = "33"
letter_codes["f"] = "333"
letter_codes["g"] = "4"
letter_codes["h"] = "44"
letter_codes["i"] = "444"
letter_codes["j"] = "5"
letter_codes["k"] = "55"
letter_codes["l"] = "555"
letter_codes["m"] = "6"
letter_codes["n"] = "66"
letter_codes["o"] = "666"
letter_codes["p"] = "7"
letter_codes["q"] = "77"
letter_codes["r"] = "777"
letter_codes["s"] = "7777"
letter_codes["t"] = "8"
letter_codes["u"] = "88"
letter_codes["v"] = "888"
letter_codes["w"] = "9"
letter_codes["x"] = "99"
letter_codes["y"] = "999"
letter_codes["z"] = "9999"
letter_codes[" "] = "0"
letter_codes["\n"] = ""

cases = f.readline.to_i

cases.times do |i|
  
  # initialize the values
  letters = f.readline.split ""
  
  # execute the code
  message = ""
  letters.each do |letter|
    letter_code = letter_codes[letter]
    if message != "" && letter != " " && letter != "\n" && letter_code.index(message[-1, 1]) == 0
      message = message + " "
    end
    message = message + letter_code
  end
  
  o.syswrite "Case \##{i + 1}: #{message}\n"
  
end
