# Define a method that returns a boolean indicating whether its second argument is a substring of its first.
def substring?(long_string, short_string)
  long_string.include?(short_string)
end

# Write a method that, given a string, returns a hash in which each key is a character in the string and each value is an array of the first and last indices where that character occurs. If the character occurs only once, the array should contain a single index. Consider defining helper methods.
# first_last_indices("banana") => {"b" => [0], "a" => [1, 5], "n" => [2, 4]}
def first_last_indices(str)
  index_hash = Hash.new

  str.split('').uniq.each do |letter|
    start_point = 0
    end_point = 0
    letter_array = Array.new

    i = 0
    while i < str.length
      if letter == str.split('')[i]
        letter_array.push(i)
      end
      i += 1
    end

    if letter_array.length > 1
      index_hash[letter] = [letter_array[0], letter_array[letter_array.length - 1]]
    else
      index_hash[letter] = letter_array
    end

  end

  index_hash
end

# Define a method that returns the number of times that two adjacent numbers in an array sum to n. Don't reuse numbers.
# count_adjacent_sums([1, 5, 1, 3, 3], 6) => 2
def count_adjacent_sums(array, n)
  counter = 0

  used_array = Array.new

  array.each_index do |idx|
    if idx != (array.length - 1)
      if !used_array.include?(idx)
        if array[idx] + array[idx + 1] == n
          # p array[idx].to_s + ' ' + array[idx + 1].to_s
          used_array.push(idx)
          used_array.push(idx + 1)
          counter += 1
        end
      end
    end
  end
  counter
end

require_relative 'test.rb'