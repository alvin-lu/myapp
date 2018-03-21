# Write a method that accepts two strings as arguments.
# If the second string can be spelled using letters from the first, return an array of the indices of the letters of the second string as they occur in the first (choose the earlier occurrence if a letter occurs more than once). Otherwise, return false.
# The second string may reuse letters from the first.
def wordplay(string1, string2)
  str1_hash = {}
  str2_hash = {}
  position_hash = {}

  # save string1 into an hash
  string1.split('').each do |ch|
    if str1_hash[ch]
      str1_hash[ch] += 1
    else
      str1_hash[ch] = 1
    end
  end

  # save string2 into an hash
  string2.split('').each do |ch|
    if str2_hash[ch]
      str2_hash[ch] += 1
    else
      str2_hash[ch] = 1
    end
  end

  # check if each character of string2 can be found in string1
  # and if there are enough characters to make string2
  str2_hash.each do |key, value|
    if !str1_hash.key?(key)
      return false
    elsif str1_hash[key] < value
      return false
    end
  end

  # save the position of the characters found in string1
  # i = 0
  # while i < string1.length
  #   position_hash[string1[i]] = i unless position_hash[string1[i]]
  #   i += 1
  # end
  i = 0
  while i < string1.length
    if !position_hash.key?(string1[i])
      position_hash[string1[i]] = i
    end
    i += 1
  end

  # save the indices needed to create string2
  i = 0
  str2_arr = []
  while i < string2.length
    str2_arr << position_hash[string2[i]]
    i += 1
  end

  str2_arr
end

puts '----Wordplay----'
puts wordplay('substandard', 'bad') == [2, 5, 7]
puts wordplay('shadowless', 'dashes') == [3, 2, 0, 1, 7, 0]
puts wordplay('cartoon', 'lineograph') == false
