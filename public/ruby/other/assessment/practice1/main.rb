# Anagrams are two words with exactly the same letters. Order does not matter. Define a method that, given two strings, returns a boolean indicating whether they are anagrams.
def anagrams?(str1, str2)
  str1_hash = Hash.new(0)
  str2_hash = Hash.new(0)

  str1.split('').each do |letter|
    if str1_hash.key?(letter)
      str1_hash[letter] += 1
    else
      str1_hash[letter] = 1
    end
  end

  str2.split('').each do |letter|
    if str2_hash.key?(letter)
      str2_hash[letter] += 1
    else
      str2_hash[letter] = 1
    end
  end

  if str1_hash == str2_hash
    return true
  end
  return false

end

# An isogram is a word of only non-repeating letters. Define a method that, given two isograms of the same length, returns an array of two elements indicating matches: the first number is the number of letters matched in both words at the same position, and the second is the number of letters matched in both words but not in the same position.
def isogram_matcher(isogram1, isogram2)
  match_same = 0
  unmatch_same = 0

  i = 0
  while i < isogram1.length
    if isogram1[i] == isogram2[i]
      match_same += 1
    end
    i += 1
  end

  iso1_hash = Hash.new(0)
  iso2_hash = Hash.new(0)

  isogram1.split('').each do |letter|
    if iso1_hash.key?(letter)
      iso1_hash[letter] += 1
    else
      iso1_hash[letter] = 1
    end
  end
  isogram2.split('').each do |letter|
    if iso2_hash.key?(letter)
      iso2_hash[letter] += 1
    else
      iso2_hash[letter] = 1
    end
  end

  iso1_hash.each do |key, value|
    if iso2_hash.key?(key)
      if iso1_hash[key] == iso2_hash[key]
        unmatch_same += 1
      end
    end
  end

  if match_same > 0
    return [match_same, unmatch_same - 1]
  else
    return [match_same, unmatch_same]
  end
end

# You have a panoramic view in front of you, but you only can take a picture of two landmarks at a time (your camera is small). You want to capture every pair of landmarks that are next to each other. Define a method that, given an array of landmarks, returns an array of every adjacent pair from left to right. Assume the panorama wraps around.
def panoramic_pairs(landmarks)
  result_array = Array.new

  landmarks.each_with_index do |place, idx|
    if idx != landmarks.length - 1
      result_array.push([place, landmarks[idx + 1]])
    end
  end

  result_array.push([landmarks[-1], landmarks[0]])

  return result_array
end

# Xbonacci

# Define a Xbonacci method that works similarly to the fibonacci sequence.
# The fibonacci sequence takes the previous two numbers in the sequence and adds
# them together to create the next number.
#
# First five fibonacci numbers = [1, 1, 2, 3, 5]
# The fourth fibonacci number (3) is the sum of the two numbers before it
# (1 and 2).
#
# In Xbonacci, the sum of the previous X numbers (instead of the previous 2 numbers)
# of the sequence becomes the next number in the sequence.
#
# The method will take two arguments: the starting sequence with X number of
# elements and an integer N. The method will return the first N elements in the given
# sequence.
#
# xbonacci([1, 1], 5) => [1, 1, 2, 3, 5]
# xbonacci([1, 1, 1, 1], 8) => [1, 1, 1, 1, 4, 7, 13, 25]
#
# X is the length of the starting sequence.
#
# number_of_xbonacci_numbers_to_return is the same as N.

def xbonacci(starting_sequence, number_of_xbonacci_numbers_to_return)

  xbon_array = starting_sequence

  i = starting_sequence.length
  offset = starting_sequence.length

  while i < number_of_xbonacci_numbers_to_return
    sum = 0
    j = i
    bottom = j - offset
    while j > bottom
      sum += xbon_array[j - 1]
      j -= 1
    end
    xbon_array.push(sum)
    i += 1
  end
  return xbon_array

end

require_relative "test.rb"