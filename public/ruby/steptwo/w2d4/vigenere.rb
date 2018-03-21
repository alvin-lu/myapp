# Vigenere Cipher

# Vigenere's Cipher is a tool for encrypting strings. We'll offset each character
# according to a key sequence. For example, if we encrypt "bananasinpajamas" with the
# key sequence [1, 2, 3], the result would be "ccqbpdtkqqcmbodt":
#
# Word:   b a n a n a s i n p a j a m a s
# Keys:   1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Cipher: c c q b p d t k q q c m b o d t
#
# Note that offsets should wrap around the alphabet - offsetting 'z' by 1 should
# produce 'a'. It could wrap the around the alphabet n number of times;
# for example, 100 times.
#
# Write a method that takes a string and a key-sequence, returning
# the encrypted word. Assume only lower-case letters are used.

# We're giving you the alphabet as an array, don't modify it!
# ------------------------------------------------------------------------------

def vigenere_cipher(string, key_sequence)
  string_array = string.split("")
  vigenere_array = Array.new
  result_array = Array.new
  # sets the offsets to each letter of the string
  seq_idx = 0
  string_array.each do |element|
    if seq_idx == key_sequence.length - 1
      vigenere_array.push([element, key_sequence[seq_idx]])
      seq_idx = 0
    else
      vigenere_array.push([element, key_sequence[seq_idx]])
      seq_idx += 1
    end
  end
  # transposing the letters with the offset
  vigenere_array.each do |element|
    if (element[0].ord + element[1]) > 122
      result_array << (element[0].ord + element[1] - 122 + 97 - 1).chr
    else
      result_array << (element[0].ord + element[1]).chr
    end
  end
  result_array.join("")
end

# a => 97 & z => 122
puts "----Vigenere cipher----"
puts vigenere_cipher("toerrishuman", [1]) == "upfssjtivnbo"
puts vigenere_cipher("toerrishuman", [1, 2]) == "uqftsktjvobp"
puts vigenere_cipher("toarrispirate", [1, 2, 3, 4]) == "uqdvskvtjtdxf"
puts vigenere_cipher("zzz", [1, 2, 1]) === "aba"
