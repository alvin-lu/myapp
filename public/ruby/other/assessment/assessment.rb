### Missing Numbers
#
# Given an array of unique integers ordered from least to greatest, write
# a method that returns an array of the integers that are needed to
# fill in the consecutive set.

def missing_numbers(nums)
  missing_array = []
  temp_value = nums[0]
  while temp_value < nums[-1]
    if nums.include?(temp_value)
    else
      missing_array.push(temp_value)
    end
    temp_value += 1
  end
  missing_array
end

puts '-------Missing Numbers-------'
puts missing_numbers([1, 3]) == [2]
puts missing_numbers([2, 3, 7]) == [4, 5, 6]
puts missing_numbers([-5, -1, 0, 3]) == [-4, -3, -2, 1, 2]
puts missing_numbers([0, 5]) == [1, 2, 3, 4]

### Titleize
#
# Write a method that capitalizes each word in a string like a book title.
# Do not capitalize words like 'a', 'and', 'of', 'over' or 'the'.

def titleize(title)
  capitalized_title = []
  uncapitalized_words = %w[a and of over the]
  title.split(' ').each.with_index do |word, idx|
    if uncapitalized_words.include?(word)
      if idx == 0
        capitalized_title.push(word[0].upcase + word[1..-1])
      else
        capitalized_title.push(word)
      end
    else
      capitalized_title.push(word[0].upcase + word[1..-1])
    end
  end
  capitalized_title.join(' ')
end

puts '-------Titleize-------'
puts titleize('basketball') == 'Basketball'
puts titleize('stephen curry') == 'Stephen Curry'
puts titleize('war and peace') == 'War and Peace'
puts titleize('the bridge over the river kwai') == 'The Bridge over the River Kwai'

# Unique in Order
#
# Implement the function unique_in_order which takes a string and
# returns an array of letters without any elements with the same value next
# to each other. Preserve the original order of elements.

def unique_in_order(string)
  result_array = Array.new
  current_letter = ''
  string.split('').each do |letter|
    next if letter == current_letter
    if letter != current_letter
      current_letter = letter
      result_array.push(letter)
    end
  end
  result_array
end

puts "-------Unique in Order-------"
puts unique_in_order('AAAABBBCCDAABBB') == %w[A B C D A B]
puts unique_in_order('BBBAAAACCDAABBB') == %w[B A C D A B]
puts unique_in_order('ABBCcAD') == %w[A B C c A D]
puts unique_in_order('aAa') == %w[a A a]

# Substrings
#
# Return an array of all the substrings for a given string.
# Be sure that the returned array is sorted.

def substrings(string)
  result_array = Array.new
  string.split('').each_index do |idx|
    temp_string = ''
    while idx < string.length
      temp_string += string[idx]
      result_array.push(temp_string)
      idx += 1
    end
  end
  result_array.sort
end

puts "-------Substrings-------"
puts substrings("") == []
puts substrings("123") == %w[1 12 123 2 23 3]
puts substrings("ruby") == %w[b by r ru rub ruby u ub uby y]
